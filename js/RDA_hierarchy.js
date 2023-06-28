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

var expand_link = document.getElementById("expand")
/* toggle guidance caret when link is clicked (from prop list to prop detail) */
expand_link.addEventListener("click", function(){
  var tog = document.getElementsByClassName("caret")
  for (i = 0; i < tog.length; i++) {
    if (!tog[i].parentElement.querySelector(".nested").classList.contains("active")) {
      tog[i].parentElement.querySelector(".nested").classList.toggle("active");
      tog[i].classList.toggle("caret-down");
    }
  };
})

var collapse_link = document.getElementById("collapse")
/* toggle guidance caret when link is clicked (from prop list to prop detail) */
collapse_link.addEventListener("click", function(){
  var tog = document.getElementsByClassName("caret")
  for (i = 0; i < tog.length; i++) {
    if (tog[i].parentElement.querySelector(".nested").classList.contains("active")) {
      tog[i].parentElement.querySelector(".nested").classList.toggle("active");
      tog[i].classList.toggle("caret-down");
    }
  };
})