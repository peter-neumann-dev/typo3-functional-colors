import '../StyleSheets/main.scss'
import { initAtomicLibrary } from './Modules/library.js'
import { initOnScrollFadingBackgrounds } from './Modules/onScrollFadingBackgrounds.js'

// eslint-disable-next-line no-undef
AOS.init()
initOnScrollFadingBackgrounds()
initAtomicLibrary()
