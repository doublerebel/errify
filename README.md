# errify

Basic node-style callback error helper for iced-coffee-script

[![Build Status][ci-master]][travis-ci]
[![Coverage Status][coverage-master]][coveralls]
[![Dependency Status][dependency]][david]
[![devDependency Status][dev-dependency]][david]
[![Downloads][downloads]][npm]

Originally described by [@maxtaco](https://github.com/maxtaco) as the *"Error Short-Circuiter" pattern*:

http://maxtaco.github.io/programming/2014/09/18/handling-errors-in-iced-coffee-script/

[![NPM][npm-stats]][npm]

## Description

*  Creates a function that runs one function when a callback receives an error as the first argument, and runs a different function when a callback receives a null first argument (the [nodejs callback pattern](https://docs.nodejitsu.com/articles/errors/what-are-the-error-conventions/))
*  Flattens nested callbacks
*  Restores sanity

## Installation
```sh
npm install --save errify
```

## Example

Escape automatically to `callback` when `fs.readFile(...)` fails:

[nextorigin/express-rendertype/.../src/fancy.coffee#L22](https://github.com/nextorigin/express-rendertype/blob/7d4c9124b90aec2313f1f1c989898ba1f7d85bd5/src/fancy.coffee#L22)

### Contrived Example

For readability, I prefer using `ideally` as the errify keyword.  In the spirit of coffee-script it reads like English:

```coffee
{readDir, readFile} = fs

tryToReadTheFirstFileFrom = (directory, callback) ->
  ideally = errify callback
  await readDir directory, ideally defer files
  [file] = files
  await readFile file, ideally defer contents
  callback null, {files, contents}

ideally = console.error.bind console
folder  = "/path/to/a/list/of/files"

await tryToReadTheFirstFileFrom folder, ideally defer {files, contents}
console.log contents
```

## License

MIT

  [ci-master]: https://img.shields.io/travis/doublerebel/errify/master.svg?style=flat-square
  [travis-ci]: https://travis-ci.org/doublerebel/errify
  [coverage-master]: https://img.shields.io/coveralls/doublerebel/errify/master.svg?style=flat-square
  [coveralls]: https://coveralls.io/r/doublerebel/errify
  [dependency]: https://img.shields.io/david/doublerebel/errify.svg?style=flat-square
  [david]: https://david-dm.org/doublerebel/errify
  [dev-dependency]: https://img.shields.io/david/dev/doublerebel/errify.svg?style=flat-square
  [david-dev]: https://david-dm.org/doublerebel/errify#info=devDependencies
  [downloads]: https://img.shields.io/npm/dm/errify.svg?style=flat-square
  [npm]: https://www.npmjs.org/package/errify
  [npm-stats]: https://nodei.co/npm/errify.png?downloads=true&downloadRank=true&stars=true
