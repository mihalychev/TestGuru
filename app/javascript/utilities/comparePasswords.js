document.addEventListener('turbolinks:load', () => {
  const password = document.querySelector('#user_password')
  const passwordConfirmation = document.querySelector('#user_password_confirmation')

  if (password && passwordConfirmation) {
    password.addEventListener('input', checkPassword)
    passwordConfirmation.addEventListener('input', checkPasswordConfirmation)
  }
})

function checkPassword() {
  const passwordConfirmation = document.querySelector('#user_password_confirmation')

  if (this.value && passwordConfirmation.value) {
    (this.value === passwordConfirmation.value) ? showMatch() : showMismatch()
  } else {
    messageHide()
  }
}

function checkPasswordConfirmation() {
  const password = document.querySelector('#user_password')

  if (this.value && password.value) {
    (this.value === password.value) ? showMatch() : showMismatch()
  } else {
    messageHide()
  }
}

const messageHide = () => {
  const message = document.querySelector('.warning')
  message.classList.add('hidden')
}

const showMatch = () => {
  const message = document.querySelector('.warning')
  message.textContent = 'Passwords match'
  message.classList.remove('warning_mismatch')
  message.classList.add('warning_match')
  message.classList.remove('hidden')
}

const showMismatch = () => {
  const message = document.querySelector('.warning')
  message.textContent = "Passwords must match"
  message.classList.remove('warning_match')
  message.classList.add('warning_mismatch')
  message.classList.remove('hidden')
}