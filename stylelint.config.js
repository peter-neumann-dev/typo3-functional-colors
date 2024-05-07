/** @type {import('stylelint').Config} */
export default {
  extends: ['stylelint-config-standard-scss'],
  rules: {
    'no-descending-specificity': null,
    'selector-class-pattern': null,
    'selector-pseudo-element-colon-notation': 'single',
    'value-keyword-case': [
      'lower',
      {
        camelCaseSvgKeywords: true,
      },
    ],
    'at-rule-disallowed-list': ['import'],
    'media-feature-range-notation': 'prefix',
    'scss/dollar-variable-empty-line-before': null,
    'scss/dollar-variable-colon-space-after': 'at-least-one-space',
    'scss/selector-no-redundant-nesting-selector': true,
    'scss/at-use-no-unnamespaced': true,
  },
}
