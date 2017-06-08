# Learning By Doing

Here is the tutorial ([Part I](https://auth0.com/blog/creating-your-first-elm-app-part-1/) and [Part II](https://auth0.com/blog/creating-your-first-elm-app-part-2)) where you can learn how to build web applications with [Elm](http://elm-lang.org/). If the learning curve in this tutorial is too steep for you, learn basics [here](https://guide.elm-lang.org/install.html).

In this code are used [Gulp](http://gulpjs.com/) (to build and serve application locally) and [NodeJS](https://nodejs.org/en) (to serve API and install dependencies through the Node Package Manager (`npm`)).

You can view application at [http://localhost:3000].

## Steps

- [x] Setup Build Tools
  - [x] Create project root folder
  - [x] Create in the root folder an `elm-package.json` and run `elm package install` in terminal
  - [x] Create in the root folder a `package.json` and run `npm install` in terminal
  - [x] Create some folders and helpers files
    - [x] Create `/src` and `/dist` folders at the root of the project
    - [x] Create a basic `/src/index.html` file
    - [x] Create `/src/styles.css` file
    - [x] Add folders `/elm-stuff` and `/node_modules` to `.gitignore` file
  - [x] Create a `gulpfile.js` and fire up `gulp` task by running `gulp` in terminal
- [x] Build the prototype of the application
  - [x] Create `/src/Main.elm` file and describe the basic version of the `model`, `update` and `view` functions
  - [x] Style the prototype with [Bootstrap](http://getbootstrap.com/components/) styles and styles from `/src/styles.css` file
  - [] Add command `Cmd` to fetch the random quote calling API
  - [] Refactor the application wrapping fetched data in `WebData` type from `krisajenkins/RemoteData` package to [slay a UI antipattern](http://blog.jenkster.com/2016/06/how-elm-slays-a-ui-antipattern.html)
