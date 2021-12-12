// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Sidebar (offcanvas)

const btnShowSidebar = document.querySelector("#btn-show-sidebar");
btnShowSidebar.addEventListener('click', showSidebar);

const btnHideSidebar = document.querySelector("#btn-hide-sidebar");
btnHideSidebar.addEventListener('click', hideSidebar);

function showSidebar(event) {
  event.preventDefault();

  let sidebar = document.querySelector('#sidebar');
  sidebar.classList.add('visible');

  let backdrop = document.createElement('div');
  backdrop.id = 'backdrop';
  backdrop.addEventListener('click', hideSidebar);
  sidebar.after(backdrop);
  backdrop.focus();
  backdrop.classList.add('visible');
}

function hideSidebar(event) {
  event.preventDefault();

  let sidebar = document.querySelector('#sidebar');
  sidebar.classList.remove('visible');

  let backdrop = document.querySelector('#backdrop');
  backdrop.classList.remove('visible');
  setTimeout(() => { backdrop.remove(); }, 300);
}