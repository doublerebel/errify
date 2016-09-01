{expect}   = require "chai"
errify     = require "../src/errify"


contrivedFnShouldFail = (fail, callback) ->
  if fail then callback new Error
  else         callback null, "who", "what"


describe "errify", ->
  it "should escape to the error function when the first argument isn't null", (done) ->
    ideally = errify (err) ->
      expect(err).to.be.instanceof Error
      done()

    await contrivedFnShouldFail true, ideally defer()
    done new Error "we should never be here"

  it "should continue when the first argument is null", (done) ->
    ideally = errify done
    await contrivedFnShouldFail false, ideally defer first, second
    expect("who").to.equal first
    expect("what").to.equal second
    done()
