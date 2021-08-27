require("./jquery.bgswitcher")

function slideshow(){
jQuery(function($) {
  $('.workout-new-background').bgSwitcher({
      images: [ "/images/ehara.jpg", "/images/shimanto.jpg", '/images/sunset1.jpg', "/images/sea.jpg"],
      interval: 10000,
      loop: true,
      shuffle: true,
      effect: "fade",
      duration: 2000,
      easing: "swing"
  });
});
};

window.addEventListener("load", slideshow);