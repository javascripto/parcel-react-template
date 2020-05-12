#!/usr/bin/env sh

mkdir src

cat << STYLE > src/style.scss
h1 {
  color: blue;
}
STYLE

cat << PUG > src/index.pug
div#root
script(src="main.tsx")
PUG

cat << NPM > package.json
{
  "scripts": {
    "start": "parcel src/index.pug",
    "build": "parcel build src/index.pug"
  }
}
NPM

# react
cat << TSX > src/main.tsx
import React from 'react'
import { render } from 'react-dom'

import './style.scss'

const App = () => <h1>Olá Mundo</h1>

render(<App/>, document.querySelector('#root'))
TSX


cat << TSCONFIG > tsconfig.json
{
  "compilerOptions": {
    "allowSyntheticDefaultImports": true,
    "jsx": "react",
    "module": "commonjs",
    "noImplicitAny": true,
    "outDir": "./build/",
    "preserveConstEnums": true,
    "sourceMap": true,
    "target": "es5"
  },
  "include": [
    "./src/**/*"
  ]
}
TSCONFIG

npm install -D parcel-bundler typescript @types/react @types/react-dom
npm start
