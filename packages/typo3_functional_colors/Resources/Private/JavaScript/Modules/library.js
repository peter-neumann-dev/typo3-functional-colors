export const initAtomicLibrary = () => {
  const librarySections = document.querySelectorAll('.library-section')

  if (!librarySections) {
    return
  }

  librarySections.forEach((section, index) => {
    const colorSwitches = section.querySelectorAll(
      '.library-section__color-switch',
    )
    const content = section.querySelector('.library-section__content')
    const sessionStorageColor =
      sessionStorage.getItem(`atomic-library-section-${index}`) === null
        ? 'bg--default'
        : sessionStorage.getItem(`atomic-library-section-${index}`)

    content.classList.add('bg')
    content.classList.add(sessionStorageColor)

    colorSwitches.forEach((colorSwitch) => {
      colorSwitch.addEventListener('click', () => {
        colorSwitch.classList.forEach((className) => {
          if (className.startsWith('bg--')) {
            const bgClass = className
            content.classList.forEach((className) => {
              if (className.startsWith('bg--')) {
                content.classList.remove(className)
              }
            })
            content.classList.add(bgClass)
            sessionStorage.setItem(`atomic-library-section-${index}`, bgClass)
          }
        })
      })
    })
  })
}
