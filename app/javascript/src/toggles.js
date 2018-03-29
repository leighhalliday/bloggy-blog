export default () => {
  const selectors = ".select-posts,.select-categories";

  document.querySelectorAll(selectors).forEach(element => {
    element.addEventListener("click", () => {
      document.querySelector(".home-page-posts").classList.toggle("hide");
      document.querySelector(".home-page-categories").classList.toggle("hide");
      document.querySelector(".select-posts").classList.toggle("active");
      document.querySelector(".select-categories").classList.toggle("active");
      document.querySelector(".home-footer").classList.toggle("hide");
    });
  });
};
