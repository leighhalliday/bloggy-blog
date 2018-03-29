import "../styles/menu";

export default () => {
  const nav = document.querySelector("nav#menu");
  const trigger = document.querySelector(".menu-trigger");

  trigger.addEventListener("click", () => {
    trigger.classList.toggle("open");
    nav.classList.toggle("open");
  });

  document.addEventListener("keyup", e => {
    if (e.key === "Escape") {
      trigger.classList.remove("open");
      nav.classList.remove("open");
    }
  });
};
