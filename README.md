# TYPO3 Functional Colors Demo Package

[![TYPO3](https://img.shields.io/badge/TYPO3-v12-ff8700?style=flat-square&logo=typo3)](https://get.typo3.org/version/12)
[![PHP](https://img.shields.io/badge/PHP-8.3-777BB4?style=flat-square&logo=php&logoColor=white)](https://www.php.net/releases/8.3/en.php)
[![MariaDB](https://img.shields.io/badge/MariaDB-10.11-003545?style=flat-square&logo=mariadb&logoColor=white)](https://www.mysql.com/)
[![DDEV](https://img.shields.io/badge/DDEV-with_Docker-02a8e2?style=flat-square&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAAPCAYAAAAGRPQsAAAACXBIWXMAAAsSAAALEgHS3X78AAABIElEQVQ4jY2T0XGDMBBE383wbzoIHYRUELuDdBBTQXAH7sAlQCdOKsCuIKQC6GDzkVOsgCDeGY3uxGnvMZKMFUn69LBfKLmY2SEk2ZoZcAFG4CvxbQPUknIzqwAsQVMAnRv91+gKNEBrZlWKbIzm64LRBqiBFqiARtKNTNIReFwxmDYcA5XvOcVkz0AJ5J4XPnr+HkDudS1wAE7ADiCT1HiXDx+hcwuc3TCsPzhFD+yDya+0rEZSLqmbrJ8lHT3exnMGPEWdRo9fPcd/Jajw+Y3bQc0laVihnGpwmi6KFZuVfseQtA/xQuN8YtRJGlKF2xnHfXRl6gXk/FzI8JS2wHsCMNyzAtiZ2fqLkVTfQVeG+hnZxKwEXiLKqXoz60PyDWDeV6d2QUBxAAAAAElFTkSuQmCC)](https://ddev.com/)
[![Composer](https://img.shields.io/badge/Composer-v2-885630?style=flat-square&logo=composer)](https://getcomposer.org/)
[![Node.js](https://img.shields.io/badge/Node.js-20-339933?style=flat-square&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![NPM](https://img.shields.io/badge/NPM-10-CB3837?style=flat-square&logo=npm&logoColor=white)](https://www.npmjs.com/)
[![Rollup](https://img.shields.io/badge/Rollup-4-EC4A3F?style=flat-square&logo=rollupdotjs&logoColor=white)](https://rollupjs.org/)
[![Prettier](https://img.shields.io/badge/Prettier-3-F7B93E?style=flat-square&logo=prettier&logoColor=white)](https://prettier.io/)
[![ESLint](https://img.shields.io/badge/ESLint-9-4B32C3?style=flat-square&logo=eslint&logoColor=white)](https://eslint.org/)
[![Stylelint](https://img.shields.io/badge/Stylelint-16-263238?style=flat-square&logo=stylelint&logoColor=white)](https://stylelint.io/)
[![Gitmoji](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67?style=flat-square)](https://gitmoji.dev/)

<img src="packages/typo3_functional_colors/Resources/Public/Images/Backend/login-logo.jpg" width="400" alt="Functional Colors Demo Image" />

**Read me before launching any rockets! 🚀**

## 🌐 Environments

### Development

- Domain: [typo3-functional-colors.ddev.site](https://typo3-functional-colors.ddev.site/)
- TYPO3-Context: `Development`

## 🔧 Setup project

### Start the DDEV project

```bash
ddev start
```

### Create a local backend user with

```bash
ddev typo3 backend:createadmin
```

### Import database and files

```bash
ddev exec rsync -avzhP assets/initialisation/fileadmin/ public/fileadmin/
```

```bash
ddev import-db --no-drop --file=assets/initialisation/database.sql.gz
```

### Build frontend assets

```bash
ddev npm run build
```

## 🗑️ Delete DDEV project

This will delete a project's database, DDEV's record of the project's
existence, all locally installed packages, generated and temporary files.

_**Will never touch your code or git included files.**_

```bash
ddev exec rm -rf var vendor node_modules public/typo3 public/typo3conf public/_assets public/index.php public/typo3temp
```

```bash
ddev delete -O
```
