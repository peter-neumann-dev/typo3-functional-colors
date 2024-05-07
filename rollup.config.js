import nodeResolve from '@rollup/plugin-node-resolve'
import terser from '@rollup/plugin-terser'
import autoprefixer from 'autoprefixer'
import cssnano from 'cssnano'
import postcss from 'postcss'
import { defineConfig } from 'rollup'
import scss from 'rollup-plugin-scss'
import * as sass from 'sass'

// Check if the build is a production build
const isProduction = process.env.BUILD === 'production'

export default defineConfig({
  input:
    'packages/typo3_functional_colors/Resources/Private/JavaScript/main.js',
  output: {
    dir: 'packages/typo3_functional_colors/Resources/Public/',
    format: 'iife',
    sourcemap: isProduction ? false : 'inline',
    entryFileNames: 'JavaScript/[name].min.js',
    assetFileNames: 'StyleSheets/[name][extname]',
  },
  plugins: [
    nodeResolve(),
    scss({
      sass,
      verbose: true,
      name: 'main.min.css',
      outputStyle: 'compressed',
      watch: 'packages/typo3_functional_colors/Resources/Private/StyleSheets',
      failOnError: isProduction,
      sourceMap: !isProduction,
      processor: () => postcss([autoprefixer(), cssnano()]),
    }),
    ...(isProduction ? [terser()] : []),
  ],
})
