document.addEventListener('turbolinks:load', () => {
  const controls = document.querySelectorAll('.table__inline-edit-link')

  if (controls.length) for (let control of controls) control.addEventListener('click', formInlineLinkHandler)

  const errors = document.querySelector('.resource-errors')

  if (errors) {
    const resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
  
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  const testId = this.dataset.testId
  formInlineHandler(testId)
}

const formInlineHandler = testId => {
  const link = document.querySelector(`.table__inline-edit-link[data-test-id="${testId}"]`),
        testTitle = document.querySelector(`.table__test-title[data-test-id="${testId}"]`),
        formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)
  
  if (formInline && formInline.classList.contains('hidden')) {
    testTitle.classList.add('hidden')
    formInline.classList.remove('hidden')
    link.textContent = 'Cancel'
  } 
  else if (formInline && !formInline.classList.contains('hidden')) {
    testTitle.classList.remove('hidden')
    formInline.classList.add('hidden')
    link.textContent = 'Edit'
  }
}