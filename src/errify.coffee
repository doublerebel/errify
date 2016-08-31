# http://maxtaco.github.io/programming/2014/09/18/handling-errors-in-iced-coffee-script/
module.exports = (errCb) -> (continueCb) -> (err, args...) ->
  if err?
    errCb err
  else
    continueCb args...
