camelify = (str) -> str.replace /\-([a-z])/g (m, a) -> a.to-upper-case!

etter = (name, ops) !->
  name = camelify name if name.match \-
  @__defineGetter__ name, ops.get
  @__defineSetter__ name, ops.set

module.exports = etter
