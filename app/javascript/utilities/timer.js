document.addEventListener('turbolinks:load', () => {
  const timerBlock = document.querySelector('.timer')
  const form = document.querySelector('.question-form')
  if (timerBlock) timer(timerBlock, form)
})

document.addEventListener('turbolinks:before-visit', () => {
  sessionStorage.clear()
})

const timer = (timerBlock, form) => {
  if (sessionStorage.getItem('timeLeft') == null) {
    sessionStorage.setItem('timeLeft', timerBlock.dataset.timer)
  }

  timerBlock.textContent = sessionStorage.getItem('timeLeft')

  const updateTimer = setInterval(() => {
    timeLeft = sessionStorage.getItem('timeLeft') - 1
  
    if (timeLeft <= 0) {
      clearInterval(updateTimer)
      sessionStorage.clear()
      form.submit()
    } else {
      timerBlock.textContent = timeLeft
      sessionStorage.setItem('timeLeft', timeLeft)
    }
  }, 1000)
}