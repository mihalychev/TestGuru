document.addEventListener('turbolinks:load', () => {
  const timerBlock = document.querySelector('.timer')
  if (timerBlock) timer(timerBlock)
})

const timer = timerBlock => {
  if (sessionStorage.getItem('timeLeft') == null) {
    sessionStorage.setItem('timeLeft', timerBlock.dataset.timer)
  }

  timerBlock.textContent = sessionStorage.getItem('timeLeft')

  const updateTimer = setInterval(() => {
    timeLeft = sessionStorage.getItem('timeLeft') - 1
  
    if (timeLeft <= 0) {
      clearInterval(updateTimer)
      sessionStorage.clear()
      window.location.replace(window.location.href + '/result')
    } else {
      timerBlock.textContent = timeLeft
      sessionStorage.setItem('timeLeft', timeLeft)
    }
  }, 1000)
}