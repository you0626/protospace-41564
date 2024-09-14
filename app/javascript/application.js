// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
  const form = document.querySelector('form');
  if (form) {
    form.addEventListener('submit', function(event) {
      const imageField = document.querySelector('#prototype_image');
      if (imageField) {
        imageField.value = '';
      }
    });
  }
});