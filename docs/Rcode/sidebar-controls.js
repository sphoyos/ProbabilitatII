(function () {
  function addSidebarControls() {
    var summary = document.querySelector('.book-summary .summary');
    if (!summary || document.getElementById('course-sidebar-brand')) return;

    var brand = document.createElement('li');
    brand.id = 'course-sidebar-brand';
    brand.innerHTML = '<a href="./" aria-label="Inici del llibre"><img src="images/logo_UB.png" alt="Universitat de Barcelona"></a>';

    var printItem = document.createElement('li');
    printItem.id = 'course-sidebar-print';
    var printButton = document.createElement('button');
    printButton.type = 'button';
    printButton.textContent = 'Imprimeix o desa en PDF';
    printButton.addEventListener('click', function () { window.print(); });
    printItem.appendChild(printButton);

    var locationItem = document.createElement('aside');
    locationItem.id = 'course-current-location';
    locationItem.setAttribute('aria-live', 'polite');
    locationItem.innerHTML = '<span class="location-label">Estàs a</span><span class="location-title"></span>';

    summary.insertBefore(printItem, summary.firstChild);
    summary.insertBefore(brand, summary.firstChild);
    document.body.appendChild(locationItem);

    var title = locationItem.querySelector('.location-title');

    function updateLocation() {
      var headings = Array.prototype.slice.call(document.querySelectorAll('.page-inner section.normal h1, .page-inner section.normal h2, .page-inner section.normal h3'));
      var current = headings[0];
      headings.forEach(function (heading) {
        if (heading.getBoundingClientRect().top <= 150) current = heading;
      });
      title.textContent = current ? current.textContent.replace(/\s*¶\s*$/, '').trim() : document.title;
    }

    updateLocation();
    window.addEventListener('scroll', updateLocation, { passive: true });
    window.addEventListener('hashchange', updateLocation);
    if (window.gitbook && gitbook.events) {
      gitbook.events.bind('page.change', function () { window.setTimeout(updateLocation, 100); });
    }
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', addSidebarControls);
  else addSidebarControls();
  window.addEventListener('load', addSidebarControls);
}());
