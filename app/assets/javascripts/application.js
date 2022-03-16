// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", () => {
//   alert("page has loaded! - turbolinks -load ");
  var burger = document.querySelector('.burger');
  // var menu = document.querySelector('#' + burger.dataset.target);
  var menu = document.getElementById('navbar');
  burger.addEventListener('click', function () {
    burger.classList.toggle('is-active');
    menu.classList.toggle('is-active');
  });

  //Get the button:
  mybutton = document.getElementById("myBtn");

  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function() {scrollFunction()};
  (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
    const $notification = $delete.parentNode;

    $delete.addEventListener('click', () => {
      $notification.parentNode.removeChild($notification);
    });
  });

  sketchButton();
});

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  window.scrollTo({top: 0, behavior: "smooth"});
  // document.body.scrollTop = 0; // For Safari
  // document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

function sketchButton() {
  const createSVG = (width, height, radius) => {
    const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  
    const rectangle = document.createElementNS(
      "http://www.w3.org/2000/svg",
      "rect"
    );
  
    svg.setAttributeNS(
      "http://www.w3.org/2000/svg",
      "viewBox",
      `0 0 ${width} ${height}`
    );
  
    rectangle.setAttribute("x", "0");
    rectangle.setAttribute("y", "0");
    rectangle.setAttribute("width", "100%");
    rectangle.setAttribute("height", "100%");
    rectangle.setAttribute("rx", `${radius}`);
    rectangle.setAttribute("ry", `${radius}`);
    rectangle.setAttribute("pathLength", "10");
  
    svg.appendChild(rectangle);
  
    return svg;
  };
  
  document.querySelectorAll(".sketch-button").forEach((button) => {
    const style = getComputedStyle(button);
  
    const lines = document.createElement("div");
  
    lines.classList.add("lines");
  
    const groupTop = document.createElement("div");
    const groupBottom = document.createElement("div");
  
    const svg = createSVG(
      button.offsetWidth,
      button.offsetHeight,
      parseInt(style.borderRadius, 10)
    );
  
    groupTop.appendChild(svg);
    groupTop.appendChild(svg.cloneNode(true));
    groupTop.appendChild(svg.cloneNode(true));
    groupTop.appendChild(svg.cloneNode(true));
  
    groupBottom.appendChild(svg.cloneNode(true));
    groupBottom.appendChild(svg.cloneNode(true));
    groupBottom.appendChild(svg.cloneNode(true));
    groupBottom.appendChild(svg.cloneNode(true));
  
    lines.appendChild(groupTop);
    lines.appendChild(groupBottom);
  
    button.appendChild(lines);
  
    button.addEventListener("pointerenter", () => {
      button.classList.add("start");
    });
  
    svg.addEventListener("animationend", () => {
      button.classList.remove("start");
    });
  });
  
} 