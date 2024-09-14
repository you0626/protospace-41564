// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  const form = document.querySelector('form');
  
  if (form) {
    form.addEventListener('submit', () => {
      const fileInput = document.querySelector('#prototype_image');
      if (fileInput && form.querySelector('.field_with_errors')) {
        fileInput.value = '';  // 画像フィールドをリセット
      }
    });
  }
});