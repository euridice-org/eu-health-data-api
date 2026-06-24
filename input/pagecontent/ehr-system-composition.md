This page focusses on several patterns that can be used to construct an EHR system. All of these options represent valid ways to implement EHR systems.

### Direct implementation

The default/standard way of implementing an EHR system is presented in the figure below.
<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:40%; height:auto;" role="img" >
      <image href="deployment-options-straight.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: EHDS system implements APIs</em></figcaption>
  </figure>
  <p></p>
</div>

The EHR system definition defines the EHR System API without relying on other components. Functionally this is equivalent to the options presented below although the way it is implemented differs.

### Facade

A system can also choose to use a Facade to implement the EHR System API.

<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:50%; height:auto;" role="img" >
    <image href="deployment-options-facade.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    <figcaption class="figure-caption"><em>Figure: EHDS system implements APIs</em></figcaption>
  </figure>
  <p></p>
</div>

In this approach, the base EHR system is not updated and a Facade is added that uses the proprietary APIs of the EHR system in order to implement the EHR System API. Please note that the boundary of the EHR system is still the grey box. So this effectively makes the Facade part of the EHR system.

### Aggregator

Instead of using a Facade to implement the EHR system API for one system, it can also provide the API for multiple systems. Aggregating the content of mulitple systems into one.
<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:70%; height:auto;" role="img" >
      <image href="deployment-options-aggregator.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: EHDS system implements APIs</em></figcaption>
  </figure>
  <p></p>
</div>
Although interesting from an implementation point of view, the context of the EHR system will then be the combination of the different EHR systems and testing will be done on the combination and not on each system separately.

### Registry

The fourth and final pattern is the Registry.
<div>
  <figure class="figure">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 816 442" class="figure-img img-responsive img-rounded center-block" style="max-width:70%; height:auto;" role="img" >
      <image href="deployment-options-registry.drawio.svg" width="816" height="442" preserveAspectRatio="xMidYMid meet" />
    </svg>
    <figcaption class="figure-caption"><em>Figure: EHDS system implements APIs</em></figcaption>
  </figure>
  <p></p>
</div>

In this approach, each of the EHR systems implement the publish option. It does not provide an API where the content can be accessed but publishes it in a registry. Effectively this makes the registry a separate system.
