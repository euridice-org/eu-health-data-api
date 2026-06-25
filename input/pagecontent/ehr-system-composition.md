This page describes common patterns for constructing an EHR system boundary that exposes the interoperability component API surface defined in this IG. These are implementation patterns, not separate conformance targets.

### Direct implementation

In a direct implementation, the EHR system exposes the API surface without relying on another component.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:40%; height:auto;" role="img" >
      <image href="deployment-options-straight.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: Direct implementation</em></figcaption>
  </figure>
  <p></p>
</div>

Functionally this is equivalent to the options below, although the internal implementation differs.

### Facade

A facade can expose the API surface in front of a base EHR system.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:50%; height:auto;" role="img" >
      <image href="deployment-options-facade.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: Facade implementation</em></figcaption>
  </figure>
  <p></p>
</div>

In this approach, the base EHR system is not updated. The facade uses proprietary APIs or internal integration points to provide the interoperability component API surface. The boundary of the EHR system is still the grey box, so the facade is treated as part of the deployed EHR system.

### Aggregator

An aggregator can provide the API surface for multiple underlying systems.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:70%; height:auto;" role="img" >
      <image href="deployment-options-aggregator.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: Aggregator implementation</em></figcaption>
  </figure>
  <p></p>
</div>

In this approach, the exposed EHR system boundary is the combination of the underlying systems. Testing and conformance are assessed at that combined boundary, not separately for each underlying system.

### Registry

A registry-style deployment publishes documents to a registry or repository component.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:70%; height:auto;" role="img" >
      <image href="deployment-options-registry.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: Registry-style implementation</em></figcaption>
  </figure>
  <p></p>
</div>

In this approach, source EHR systems publish documents, and the registry or repository component provides access to that content. This can make the registry or repository a separate system boundary.
