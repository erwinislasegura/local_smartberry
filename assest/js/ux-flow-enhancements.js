(function () {
  function onReady(fn) {
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', fn);
      return;
    }
    fn();
  }

  function isVisible(el) {
    return !!(el.offsetWidth || el.offsetHeight || el.getClientRects().length);
  }

  function getEditableFields(form) {
    return Array.prototype.slice.call(
      form.querySelectorAll('input, select, textarea')
    ).filter(function (field) {
      var type = (field.type || '').toLowerCase();
      if (field.disabled || field.readOnly) return false;
      if (!isVisible(field)) return false;
      return ['hidden', 'button', 'submit', 'reset'].indexOf(type) === -1;
    });
  }

  function normalizeValue(field) {
    if (!field || !field.value || field.tagName === 'TEXTAREA') return;
    if ((field.type || '').toLowerCase() === 'password') return;
    field.value = field.value.trim().replace(/\s{2,}/g, ' ');
  }

  function attachMenuSearch() {
    var menus = document.querySelectorAll('.sidebar-menu');
    menus.forEach(function (menu) {
      if (!menu || menu.querySelector('.ux-menu-search-item')) return;

      var item = document.createElement('li');
      item.className = 'ux-menu-search-item';
      item.innerHTML =
        '<div class="ux-menu-search-wrap">' +
        '<input type="search" class="ux-menu-search" placeholder="Buscar en menú..." aria-label="Buscar en menú">' +
        '</div>';

      menu.insertBefore(item, menu.firstChild);
      var input = item.querySelector('input');

      input.addEventListener('input', function () {
        var term = input.value.trim().toLowerCase();
        var rows = menu.querySelectorAll(':scope > li');

        rows.forEach(function (li) {
          if (li.classList.contains('ux-menu-search-item')) return;

          if (!term) {
            li.style.display = '';
            return;
          }

          var isHeader = li.classList.contains('header');
          var text = (li.textContent || '').toLowerCase();
          var show = !isHeader && text.indexOf(term) !== -1;

          if (li.classList.contains('treeview')) {
            var children = li.querySelectorAll('ul li');
            var anyChild = false;
            children.forEach(function (child) {
              var childText = (child.textContent || '').toLowerCase();
              var childMatch = childText.indexOf(term) !== -1;
              child.style.display = childMatch ? '' : 'none';
              anyChild = anyChild || childMatch;
            });
            show = show || anyChild;
          }

          li.style.display = show ? '' : 'none';
        });
      });
    });
  }

  function wireConfirmationAutofill(form) {
    var fields = getEditableFields(form);
    fields.forEach(function (field) {
      var idOrName = (field.name || field.id || '').toLowerCase();
      if (!/(confirm|repet|verif|copia)/.test(idOrName)) return;

      var base = idOrName
        .replace(/confirm(ar|acion)?/g, '')
        .replace(/repet(ir|icion)?/g, '')
        .replace(/verif(icacion|icar)?/g, '')
        .replace(/copia/g, '')
        .replace(/[_\-\s]+/g, '');

      if (!base) return;

      var source = fields.find(function (candidate) {
        if (candidate === field) return false;
        var key = ((candidate.name || candidate.id || '').toLowerCase()).replace(/[_\-\s]+/g, '');
        return key.indexOf(base) !== -1 && !/(confirm|repet|verif|copia)/.test(key);
      });

      if (!source) return;

      field.dataset.autoMirror = '1';
      if (!field.value) {
        field.value = source.value;
      }

      source.addEventListener('input', function () {
        if (field.dataset.autoMirror === '1') {
          field.value = source.value;
        }
      });

      field.addEventListener('input', function () {
        field.dataset.autoMirror = field.value === source.value ? '1' : '0';
      });
    });
  }

  function enhanceForms() {
    var forms = document.querySelectorAll('form');

    forms.forEach(function (form, idx) {
      var fields = getEditableFields(form);
      if (fields.length < 3) return;

      var formId = form.id || form.name || ('form-' + idx);
      var key = 'smartberry:draft:' + window.location.pathname + ':' + formId;

      var draft = sessionStorage.getItem(key);
      if (draft) {
        try {
          var data = JSON.parse(draft);
          fields.forEach(function (field) {
            var type = (field.type || '').toLowerCase();
            if (['password', 'file'].indexOf(type) !== -1) return;
            var mapKey = field.name || field.id;
            if (!mapKey || field.value) return;
            if (Object.prototype.hasOwnProperty.call(data, mapKey)) {
              field.value = data[mapKey];
            }
          });
        } catch (e) {}
      }

      var status = document.createElement('div');
      status.className = 'ux-form-status';
      status.innerHTML = '<span class="ux-form-status__text"></span><div class="ux-form-status__bar"><span></span></div>';

      form.insertBefore(status, form.firstChild);
      var statusText = status.querySelector('.ux-form-status__text');
      var statusBar = status.querySelector('.ux-form-status__bar span');

      function updateStatus() {
        var required = fields.filter(function (f) {
          return f.required || f.getAttribute('aria-required') === 'true';
        });
        var baseSet = required.length ? required : fields.filter(function (f) {
          return (f.type || '').toLowerCase() !== 'hidden';
        });

        var completed = baseSet.filter(function (f) {
          if ((f.type || '').toLowerCase() === 'checkbox') return f.checked;
          return !!(f.value && String(f.value).trim().length);
        }).length;

        var total = baseSet.length || 1;
        var percent = Math.round((completed / total) * 100);
        statusText.textContent = 'Progreso del formulario: ' + completed + '/' + total + ' completado';
        statusBar.style.width = percent + '%';
      }

      fields.forEach(function (field, fieldIndex) {
        field.setAttribute('autocomplete', field.getAttribute('autocomplete') || 'on');

        field.addEventListener('blur', function () {
          normalizeValue(field);
          updateStatus();
        });

        field.addEventListener('input', function () {
          updateStatus();

          var map = {};
          fields.forEach(function (f) {
            var type = (f.type || '').toLowerCase();
            if (['password', 'file'].indexOf(type) !== -1) return;
            var name = f.name || f.id;
            if (!name) return;
            map[name] = f.value;
          });
          sessionStorage.setItem(key, JSON.stringify(map));
        });

        field.addEventListener('keydown', function (event) {
          if (event.key !== 'Enter') return;
          if ((field.tagName || '').toLowerCase() === 'textarea') return;

          var next = fields[fieldIndex + 1];
          if (!next) return;

          event.preventDefault();
          next.focus();
        });
      });

      wireConfirmationAutofill(form);
      updateStatus();
    });
  }

  onReady(function () {
    attachMenuSearch();
    enhanceForms();
  });
})();
