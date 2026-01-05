// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  setTimeout(() => {
    document.querySelectorAll(".toast").forEach((toast) => {
      toast.remove();
    });
  }, 3000);
});
