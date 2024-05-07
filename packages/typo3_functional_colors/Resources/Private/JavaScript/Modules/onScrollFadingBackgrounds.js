export const initOnScrollFadingBackgrounds = () => {
  const frames = document.querySelectorAll('.main--onscroll-fading > .frame')
  const mainDynamicBackground = document.querySelector(
    '.main--onscroll-fading .main__dynamic-background',
  )

  if (!frames.length || !mainDynamicBackground) {
    return
  }

  const clearBackgroundClasses = () => {
    mainDynamicBackground.classList.forEach((className) => {
      if (className.startsWith('bg--')) {
        mainDynamicBackground.classList.remove(className)
      }
    })
  }

  const updateBackground = (entry) => {
    entry.target.classList.forEach((className) => {
      if (className.startsWith('bg--')) {
        clearBackgroundClasses()
        mainDynamicBackground.classList.add(className)
      }
    })
  }

  const callback = (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        updateBackground(entry)
      }
    })
  }

  const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.5,
  }

  const observer = new IntersectionObserver(callback, observerOptions)

  frames.forEach((section) => observer.observe(section))
}
