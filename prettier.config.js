/** @type {import("prettier").Config} */
export default {
  semi: false,
  singleQuote: true,
  plugins: [
    '@trivago/prettier-plugin-sort-imports',
    'prettier-plugin-packagejson',
    'prettier-plugin-sh',
    'prettier-plugin-sql',
  ],
  importOrder: ['^@/(.*)$', '^[./]'],
  importOrderSortSpecifiers: true,
}
