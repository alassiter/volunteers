document.addEventListener('turbolinks:load', function(){
  setTimeout(function() {
    document.getElementsByClassName('notification')[0].className += " fade";
  }, 3000);
})