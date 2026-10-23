window.__COMPARE_SIDE__="left";
(() => {
  const HEADER_SELECTOR = "h1,h2,h3,h4,h5,h6";
  const globalSide = typeof window.__COMPARE_SIDE__ === "string" ? window.__COMPARE_SIDE__ : null;
  const current = document.currentScript;
  const scriptSide = current
    ? new URL(current.src, window.location.href).searchParams.get("side") || "unknown"
    : "unknown";
  const side = globalSide === "left" || globalSide === "right" ? globalSide : scriptSide;
  const debugEnabled = true;

  const debug = (message, details) => {
    if (!debugEnabled) {
      return;
    }

    // eslint-disable-next-line no-console
    console.debug(`[compare-bridge:${side}] ${message}`, details || "");
  };

  let applyScrollLock = false;
  let pendingScroll = false;

  const post = (payload) => {
    debug("emit", payload);
    window.parent.postMessage({ source: "compare-bridge", side, ...payload }, "*");
  };

  const normalizedScroll = () => {
    const doc = document.documentElement;
    const max = Math.max(1, doc.scrollHeight - window.innerHeight);
    const top = Math.max(0, window.scrollY || doc.scrollTop || 0);
    return top / max;
  };

  const normalizeText = (value) => (value || "").replace(/\s+/g, " ").trim();

  const getHeadingMetrics = () => {
    const scrollTop = window.scrollY || document.documentElement.scrollTop || 0;
    const occurrenceCountByKey = new Map();

    return Array.from(document.querySelectorAll(HEADER_SELECTOR))
      .map((element) => ({
        element,
        text: normalizeText(element.textContent),
        level: Number(element.tagName.slice(1)),
        top: element.getBoundingClientRect().top + scrollTop,
      }))
      .filter((heading) => heading.text.length > 0)
      .map((heading) => {
        const key = `${heading.level}:${heading.text}`;
        const occurrence = occurrenceCountByKey.get(key) || 0;
        occurrenceCountByKey.set(key, occurrence + 1);
        return { ...heading, occurrence };
      });
  };

  const getScrollAnchor = () => {
    const headings = getHeadingMetrics();
    if (headings.length === 0) {
      return null;
    }

    const scrollTop = window.scrollY || document.documentElement.scrollTop || 0;
    const toleranceTop = scrollTop + 1;
    const lastAboveTop = headings.filter((heading) => heading.top <= toleranceTop).at(-1);
    const chosen = lastAboveTop || headings[0];

    return {
      text: chosen.text,
      level: chosen.level,
      occurrence: chosen.occurrence,
      offset: scrollTop - chosen.top,
    };
  };

  const clampScrollTop = (value) => {
    const doc = document.documentElement;
    const max = Math.max(0, doc.scrollHeight - window.innerHeight);
    return Math.max(0, Math.min(max, value));
  };

  const findMatchingHeading = (anchor) => {
    if (!anchor) {
      return null;
    }

    const headings = getHeadingMetrics();
    if (headings.length === 0) {
      return null;
    }

    const exactMatches = headings.filter(
      (heading) => heading.level === anchor.level && heading.text === anchor.text
    );
    if (exactMatches.length > 0) {
      return exactMatches[Math.min(anchor.occurrence, exactMatches.length - 1)];
    }

    const textMatches = headings.filter((heading) => heading.text === anchor.text);
    if (textMatches.length > 0) {
      return textMatches[Math.min(anchor.occurrence, textMatches.length - 1)];
    }

    const sameLevelMatches = headings.filter((heading) => heading.level === anchor.level);
    if (sameLevelMatches.length > 0) {
      return sameLevelMatches[Math.min(anchor.occurrence, sameLevelMatches.length - 1)];
    }

    return headings[0] || null;
  };

  const applyHeaderAlignedScroll = (anchor, ratio) => {
    const matchingHeading = findMatchingHeading(anchor);
    if (matchingHeading) {
      const nextScrollTop = clampScrollTop(matchingHeading.top + (Number(anchor.offset) || 0));
      debug("apply header-aligned scroll", {
        anchor,
        matchedText: matchingHeading.text,
        nextScrollTop,
      });
      window.scrollTo({ top: nextScrollTop, behavior: "auto" });
      return;
    }

    const normalizedRatio = Number(ratio);
    if (!Number.isFinite(normalizedRatio)) {
      debug("ignore scroll because no heading or valid ratio", { anchor, ratio });
      return;
    }

    const doc = document.documentElement;
    const max = Math.max(1, doc.scrollHeight - window.innerHeight);
    debug("fallback to ratio scroll sync", { ratio: normalizedRatio, max });
    window.scrollTo({ top: Math.max(0, Math.min(1, normalizedRatio)) * max, behavior: "auto" });
  };

  const emitScroll = () => {
    if (applyScrollLock) {
      debug("skip local scroll emit due to lock");
      return;
    }

    post({ type: "bridge:scroll", ratio: normalizedScroll(), anchor: getScrollAnchor() });
  };

  window.addEventListener(
    "scroll",
    () => {
      if (pendingScroll) {
        return;
      }

      pendingScroll = true;
      requestAnimationFrame(() => {
        pendingScroll = false;
        emitScroll();
      });
    },
    { passive: true }
  );

  const safeHref = (rawHref) => {
    if (!rawHref) {
      return null;
    }

    const trimmed = rawHref.trim().toLowerCase();
    if (
      trimmed.startsWith("javascript:") ||
      trimmed.startsWith("mailto:") ||
      trimmed.startsWith("tel:")
    ) {
      return null;
    }

    return rawHref;
  };

  const closeAllDropdowns = () => {
    document.querySelectorAll(".dropdown.show").forEach((dropdown) => {
      dropdown.classList.remove("show");
    });

    document.querySelectorAll(".dropdown-menu.show").forEach((menu) => {
      menu.classList.remove("show");
    });

    document
      .querySelectorAll("[data-bs-toggle='dropdown'], .dropdown-toggle")
      .forEach((toggle) => {
        if (toggle instanceof Element) {
          toggle.setAttribute("aria-expanded", "false");
        }
      });
  };

  const isDropdownToggleAnchor = (anchor) =>
    anchor.matches("[data-bs-toggle='dropdown'], .dropdown-toggle") ||
    (anchor.getAttribute("href") || "").trim() === "#";

  const handleDropdownToggle = (anchor) => {
    const dropdown = anchor.closest(".dropdown");
    const menu = dropdown?.querySelector(":scope > .dropdown-menu, .dropdown-menu");
    if (!(dropdown instanceof HTMLElement) || !(menu instanceof HTMLElement)) {
      return false;
    }

    const isOpen = dropdown.classList.contains("show") || menu.classList.contains("show");
    closeAllDropdowns();

    if (!isOpen) {
      dropdown.classList.add("show");
      menu.classList.add("show");
      anchor.setAttribute("aria-expanded", "true");
    }

    return true;
  };

  document.addEventListener("click", (event) => {
    const target = event.target;
    if (!(target instanceof Element)) {
      return;
    }

    if (!target.closest(".dropdown")) {
      closeAllDropdowns();
    }
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      closeAllDropdowns();
    }
  });

  document.addEventListener(
    "click",
    (event) => {
      if (event.defaultPrevented) {
        return;
      }

      const target = event.target;
      if (!(target instanceof Element)) {
        return;
      }

      const anchor = target.closest("a");
      if (!(anchor instanceof HTMLAnchorElement)) {
        return;
      }

      // eslint-disable-next-line no-console
      console.log(`[compare-bridge:${side}] link clicked`, {
        href: anchor.getAttribute("href"),
        resolvedHref: anchor.href,
        target: anchor.target || "_self",
      });

      if (anchor.target && anchor.target !== "_self") {
        return;
      }

      if (anchor.hasAttribute("download")) {
        return;
      }

      if (isDropdownToggleAnchor(anchor) && handleDropdownToggle(anchor)) {
        event.preventDefault();
        event.stopPropagation();
        debug("handled dropdown toggle", {
          text: normalizeText(anchor.textContent),
          href: anchor.getAttribute("href"),
        });
        return;
      }

      const href = safeHref(anchor.getAttribute("href"));
      if (!href) {
        return;
      }

      // Resolve against the document base (including injected <base>) so relative links
      // map to the upstream site, not the local /api/render proxy URL.
      const resolved = new URL(href, document.baseURI || window.location.href);

      // Same-page anchor navigation: only the hash differs from the current page.
      // Let the browser scroll to the element instead of reloading the page.
      if (resolved.hash) {
        const currentBase = new URL(document.baseURI || window.location.href);
        if (
          resolved.origin === currentBase.origin &&
          resolved.pathname === currentBase.pathname &&
          resolved.search === currentBase.search
        ) {
          event.preventDefault();
          let anchorId = resolved.hash.slice(1);
          try {
            anchorId = decodeURIComponent(anchorId);
          } catch (_) {
            // keep raw value if decoding fails
          }
          const el = document.getElementById(anchorId);
          if (el) {
            el.scrollIntoView({ behavior: "smooth" });
            debug("scroll to same-page anchor", { anchorId });
          }
          return;
        }
      }

      event.preventDefault();
      debug("intercept link click", { href: resolved.href });
      post({ type: "bridge:navigate", url: resolved.href });
    },
    true
  );

  const emitLocation = () => {
    post({ type: "bridge:location", url: window.location.href });
  };

  window.addEventListener("popstate", emitLocation);
  window.addEventListener("hashchange", emitLocation);

  window.addEventListener("message", (event) => {
    const data = event.data;
    if (!data || data.source !== "compare-parent") {
      return;
    }

    debug("received command", data);

    if (data.targetSide !== side) {
      debug("ignore command for other side", { targetSide: data.targetSide });
      return;
    }

    if (data.type === "parent:scroll") {
      const ratio = Number(data.ratio);
      if (!Number.isFinite(ratio) && !data.anchor) {
        debug("ignore invalid scroll command", { ratio: data.ratio, anchor: data.anchor });
        return;
      }

      applyScrollLock = true;
      applyHeaderAlignedScroll(data.anchor, ratio);
      window.setTimeout(() => {
        applyScrollLock = false;
        debug("scroll lock released");
      }, 120);
      return;
    }

    if (data.type === "parent:navigate" && typeof data.url === "string") {
      debug("apply navigate sync", { url: data.url });
      window.location.assign(data.url);
      return;
    }

    if (data.type === "parent:history" && typeof data.direction === "string") {
      debug("apply history sync", { direction: data.direction });
      if (data.direction === "back") {
        window.history.back();
      } else if (data.direction === "forward") {
        window.history.forward();
      }
    }
  });

  post({ type: "bridge:ready", url: window.location.href });
  emitLocation();
})();
