import pluginJs from '@eslint/js'
import eslintConfigPrettier from 'eslint-config-prettier'
import globals from 'globals'

export default [
  { languageOptions: { globals: { ...globals.browser, ...globals.jquery } } },
  pluginJs.configs.recommended,
  eslintConfigPrettier,
  {
    rules: {
      'spaced-comment': ['error', 'always', { exceptions: ['!'] }],
    },
  },
]
