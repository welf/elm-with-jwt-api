# Learning By Doing

Here is the tutorial ([Part I](https://auth0.com/blog/creating-your-first-elm-app-part-1/) and [Part II](https://auth0.com/blog/creating-your-first-elm-app-part-2)) where you can learn how to build web applications with [Elm](http://elm-lang.org/). If the learning curve in this tutorial is too steep for you, learn basics [here](https://guide.elm-lang.org/install.html).

In this code are used [Gulp](http://gulpjs.com/) (to build and serve application locally) and [NodeJS](https://nodejs.org/en) (to serve API and install dependencies through the Node Package Manager (`npm`)).

You can view application at [http://localhost:3000](http://localhost:3000).

## Steps

- [x] Setup Build Tools
  - [x] Create project root folder
  - [x] Create a [`elm-package.json`](https://github.com/welf/elm-with-jwt-api/blob/master/elm-package.json) file in the root folder and run `elm package install` in terminal
  - [x] Create a [`package.json`](https://github.com/welf/elm-with-jwt-api/blob/master/package.json) file in the root folder and run `npm install` in terminal
  - [x] Create some folders and helpers files
    - [x] Create [`/src`](https://github.com/welf/elm-with-jwt-api/tree/master/src) and `/dist` folders in the root of the project
    - [x] Create a basic [`/src/index.html`](https://github.com/welf/elm-with-jwt-api/blob/master/src/index.html) file
    - [x] Create [`/src/styles.css`](https://github.com/welf/elm-with-jwt-api/blob/master/src/styles.css) file
    - [x] Add folders `/elm-stuff` and `/node_modules` to [`.gitignore`](https://github.com/welf/elm-with-jwt-api/blob/master/.gitignore) file
  - [x] Create a [`gulpfile.js`](https://github.com/welf/elm-with-jwt-api/blob/master/gulpfile.js) in the root folder and fire up `gulp` task by running `gulp` in terminal
- [x] Build the prototype of the application
  - [x] Create [`/src/Main.elm`](https://github.com/welf/elm-with-jwt-api/blob/master/src/Main.elm) file and describe the basic version of the `model`, `update` and `view` functions
  - [x] Style the prototype with [Bootstrap](http://getbootstrap.com/components/) styles and styles from [`/src/styles.css`](https://github.com/welf/elm-with-jwt-api/blob/master/src/styles.css) file
  - [x] Make sure the [API server](https://github.com/auth0-blog/nodejs-jwt-authentication-sample) is up and running
  - [x] Add command `Cmd` to call the API to fetch the random quote
  - [x] Refactor the application by wrapping model data in `WebData` type from [`krisajenkins/RemoteData`](http://package.elm-lang.org/packages/krisajenkins/remotedata/latest) package to [slay a UI antipattern](http://blog.jenkster.com/2016/06/how-elm-slays-a-ui-antipattern.html)
- Add authentication of users to call the API
  - Add user registration
    - Create registration form
    - After the user has registered, display a welcome message
    - Add encoders and decoders to encode/decode JSON objects to Elm and backwards
    - Add message exchage between the application and authentication API
    - Display authentication errors to the users and make them user-friendly
  - Add logging in and logging out
- Make authorized requests to the API to get protected quotes for authenticated users
- Persisting Logins with Local Storage
  - Add a bit of JavaScript to check local storage for previously saved `model` data
  - Add Elm functions to work with JavaScript local storage code
- Add Auth0 authorization
