

const initSlider = () => {
element = document.querySelector('#kitesize')
input = document.querySelector('#slider1')
input.addEventListener('input', (element) => {
  element.innerText = input.value
})

export { initSlider };
