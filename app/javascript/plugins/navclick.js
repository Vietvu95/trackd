function navclick() {
  const navBar = document.querySelector(".nav-bar");
  navBar.classList.toggle("active");
  }

function initClicknav() {
  // add the event listener to button
  const buttons = document.querySelectorAll(".hamburger");
  buttons.forEach((button) => {
    button.addEventListener('click', () => {
      navclick()
    })
  })
}

export { initClicknav }
