etter = (name, ops) !->
  @__defineGetter__ name, ops.get
  @__defineSetter__ name, ops.set

module.exports = etter
