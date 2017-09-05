<h2>Nido</h2>
(ported from ruby to crystal-lang)_

Structured keys helper.

Description
-----------

If you are familiar with databases like [Redis](http://code.google.com/p/redis)
and libraries like [Ohm](http://ohm.keyvalue.org) you already know how
important it is to craft the keys that will hold the data.

    >> redis = Redis.new
    >> redis.sadd("event:3:attendees", "Albert")
    >> redis.smembers("event:3:attendees")
    => ["Albert"]

It is a design pattern in key-value databases to use the key to simulate
structure, and you can read more about this in the [case study for a
Twitter clone](http://code.google.com/p/redis/wiki/TwitterAlikeExample).

Nido helps you generate those keys by providing chainable namespaces:

    >> r = Redis.new
    >> event = Nido.new("event")
    >> r.sadd(event[3][:attendees], "Albert")
    >> r.smembers(event[3][:attendees])
    => ["Albert"]

Usage
-----------

To create a new namespace:

    >> require "nido"

    >> ns = Nido.new("foo")
    => "foo"

    >> ns["bar"]
    => "foo:bar"

    >> ns["bar"]["baz"]["qux"]
    => "foo:bar:baz:qux"

And you can use any object as a key, not only strings:

    >> ns[:bar][42]
    => "foo:bar:42"

In a more realistic tone, lets assume you are working with Redis and
dealing with events:

    >> events = Nido.new("events")
    => "events"

    >> id = r.incr(events[:id])
    => 1

    >> r.sadd(events[id][:attendees], "Albert")
    => "OK"

    >> meetup = events[id]
    => "events:1"

    >> r.smembers(meetup[:attendees])
    => ["Albert"]

Installation
-----------

Add this to your application's `shard.yml`:

```yaml
dependencies:
  nido:
    github: microspino/nido-crystal
```

Thanks
-----------

to [soveran](https://github.com/[soveran]) for inventing it and inspiring me to write **minimal code** in Ruby and now Crystal.

Contributing
-----------

1. Fork it ( https://github.com/microspino/nido-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

Contributors
-----------

- [[microspino]](https://github.com/[microspino]) Microspino - creator, maintainer
