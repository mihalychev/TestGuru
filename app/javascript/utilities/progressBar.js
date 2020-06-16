document.addEventListener('turbolinks:load', () => {
  const progressBar = document.querySelector('.progress__bar')

  if (progressBar) progressBar.style.width = `${progressBar.dataset.percentage}%`
})