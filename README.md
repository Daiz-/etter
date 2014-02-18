# etter - Simpler getter/setters

Writing getters and setters in JavaScript is pretty verbose and boilerplate-y. **etter** is a small module for Node.js to make things simpler and nicer. Works nicely with plain JavaScript as well as [CoffeeScript](http://coffeescript.org/) and [LiveScript](http://livescript.net/).

## Installation

**etter** can be installed via npm:

```bash
$ npm install etter
```

## Examples

#### JavaScript

```javascript
var etter = require('etter');

function Test() {
  // bind etter to our current object as 'define'
  // this binding is required to make etter work, so don't forget it
  var define = etter.bind(this);

  // the actual values behind the getters and setters
  var _startTime = 0;
  var _endTime = 0;

  // this value will be recalculated whenever the two times are adjusted
  this.duration = 0;

  // this is needed in the update function below
  var self = this;

  // the update function
  var update = function(arg) {
    self.duration = self.endTime - self.startTime;
    return arg; 
  };

  // define startTime and endTime with getter/setters
  define('startTime', {
    get: function() { return _startTime; },
    set: function(num) { _startTime = num; return update(num); }
  });

  define('endTime', {
    get: function() { return _endTime; },
    set: function(num) { _endTime = num; return update(num); }
  });
}

var test = new Test();
test.startTime = 500;
test.endTime = 1500;
test.duration; // => 1000
```

#### CoffeeScript

```coffeescript
etter = require 'etter'

class Test
  constructor: ->
    
    # bind etter to our current object as 'define'
    # this binding is required to make etter work, so don't forget it
    define = etter.bind @

    # the actual values behind the getters and setters
    _startTime = 0
    _endTime = 0

    # this value will be recalculated whenever the two times are adjusted
    @duration = 0

    # the update function
    update = (arg) =>
      @duration = @endTime - @startTime
      arg

    # define startTime and endTime with getter/setters
    define 'startTime', {
      get: -> _startTime
      set: (num) -> _startTime = num; update num
    }

    define 'endTime', {
      get: -> _endTime
      set: (num) -> _endTime = num; update num
    }

test = new Test()
test.startTime = 500
test.endTime = 1500
test.duration # => 1000
```

#### LiveScript

```livescript
require! \etter

class Test
  ->

    # bind etter to our current object as 'define'
    # this binding is required to make etter work, so don't forget it
    define = etter.bind @

    # the actual values behind the getters and setters
    _start-time = 0
    _end-time = 0

    # this value will be recalculated whenever the two times are adjusted
    @duration = 0

    # the update function
    update = ~>
      @duration = @end-time - @start-time
      it

    # define start-time and end-time with getter/setters
    define \start-time,
      get: -> _start-time
      set: -> _start-time := it; update it

    define \end-time,
      get: -> _end-time
      set: -> _end-time := it; update it

test = new Test!
test.start-time = 500
test.end-time = 1500
test.duration # => 1000
```