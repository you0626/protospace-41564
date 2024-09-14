// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('prototype_form');
  const imageField = document.getElementById('prototype_image');

  if (form && imageField) {
    imageField.value = '';
  }
});