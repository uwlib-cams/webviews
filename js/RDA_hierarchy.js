var toggler = document.getElementsByClassName("caret");
var i;

for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested").classList.toggle("active");
    this.classList.toggle("caret-down");
  });
}

//prevents toggle on when link is clicked 
var link = document.querySelectorAll('.caret a');

for(i=0; i < link.length; i++) {
  link[i].addEventListener("click", function(e) {
    e.stopPropagation();
  });
}

