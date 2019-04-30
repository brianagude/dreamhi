// remove homepage
const button = document.querySelector(".button");
const menu = document.querySelector("section.intro");

$(button).click(function() {
  $(menu).toggleClass("show-intro");
  return false;
});
