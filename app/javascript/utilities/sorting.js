document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.sort-by-title')

  if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle () {
  const table = document.querySelector('.table')
  const rows = table.querySelectorAll('tr')

  const sortedRows = []

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  const arrowUp = this.querySelector('.octicon-arrow-up')
  const arrowDown = this.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hidden')) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.classList.remove('hidden')
    arrowDown.classList.add('hidden')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowDown.classList.remove('hidden')
    arrowUp.classList.add('hidden')
  }

  const sortedTable = document.createElement('table')
  sortedTable.classList.add('table')

  sortedTable.appendChild(rows[0])

  for (let row of sortedRows) sortedTable.appendChild(row)

  table.parentNode.replaceChild(sortedTable, table)
}

const compareRowsAsc = (row1, row2) => {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 > testTitle2) return 1
  if (testTitle2 > testTitle1) return -1 
  return 0
}

const compareRowsDesc = (row1, row2) => {
  const testTitle1 = row1.querySelector('td').textContent
  const testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 > testTitle2) return -1
  if (testTitle2 > testTitle1) return 1 
  return 0
}