    document.addEventListener('DOMContentLoaded', function() {
      window.setTimeout(function(){
        document.querySelector('body > .spinner-grow').classList.add('d-none');
        document.querySelector('.masthead').classList.remove('d-none'); 
      }, 800);
    });
