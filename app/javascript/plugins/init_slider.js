

const initSlider = () => {
  const element = document.querySelector('#kitesize')
  const input = document.querySelector('.search input[type="range"]')

  console.log("je suis la")
  console.log(element)
  console.log(input)
  if (input != null) {
    input.addEventListener('input', (event) => {
      element.innerText = input.value
    })
  }
}

export { initSlider };
