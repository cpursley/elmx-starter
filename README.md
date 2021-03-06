Elmx Starter
=======================

This is a starter app based on [Elm Tutorial](https://www.elm-tutorial.org/en/). The main difference is, it uses [elmx](https://github.com/pzavolinsky/elmx), a precompiler that takes an Elm program with embedded HTML and desugars the HTML into elm-html syntax. If you've ever used Handlebars or JSX templating before, elmx should look pretty familiar.

> Elmx is to Elm what React's JSX is to Javascript

It uses [gulp](https://github.com/gulpjs/gulp) for it's build system, but it could just as easily be [webpack](https://github.com/pzavolinsky/elmx#webpack-integration) or similar. Additionally, it uses [node-foreman](https://github.com/strongloop/node-foreman), a useful tool in it's own right that allows you to run multiple processes with one command via a [Procfile](/Procfile).


Installation
------------

You'll need to have [Yarn](https://yarnpkg.com/en/docs/install) and [Elm](https://guide.elm-lang.org/install.html) installed. Once that's done, install the build tool and Elm dependencies:

```shell
yarn setup
```

This runs both `yarn install` and `elm-package install -y`.

Workflow
------------

In a terminal, run:

```shell
yarn watch
```

This runs the [Procfile](/Procfile), which starts a [json-server](https://github.com/typicode/json-server) (a mock REST API for fast prototyping) and [gulp](/gulpfile.js) (a build tool) for watching and converting `.elmx` to `.elm` files.

In another terminal run:

```shell
yarn elm
```

This starts [elm-live](https://github.com/tomekwi/elm-live), an Elm development server with live reload out of the box. A browser window will automatically open to: [http://localhost:8000](http://localhost:8000). Elm error messages will be displayed in the terminal. Alternatively, if you'd prefer to view the Elm error messages in the browser, instead of `yarn watch`, run `elm-reactor`.


Elmx
------------

The build task compiles the `.elmx` files in the `src` directory via the elmx parser then renames the output to `.elm`. Edit the `.elmx` file, not the compiled elm file. Learn more about elmx templating syntax: [elmx syntax](https://github.com/pzavolinsky/elmx#syntax).


Tools
------------

#### Elmx syntax highlighting, autocomplete and linter

- [Atom](https://atom.io/packages/language-elmx)
- [Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=realazy.elmx)


Todo
------------

- Better formatted Elm error logging when using Procfile to run elm-live
- Switch from Gulp to [Webpack](https://github.com/pzavolinsky/elmx#webpack-integration)
- Better organization of index.html, app.js, and app.css
- Set up a `dist` directory
