Wit Plugin for Cinch
====================

This plugin lets you use [Wit's natural language processing][1] in your [Cinch][2] IRC bot.
You will need an access key from Wit in order for this to work.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'cinch-wit'
```

And then execute:

``` shell
$ bundle
```

Or install it yourself as:

``` shell
$ gem install cinch-wit
```

## Usage

Note: This guide expects you to already have basic familiarity of [Cinch][2] and [Wit][1].

After installing the gem, register the plugin in your Cinch bot, like so:

``` ruby
require 'cinch'
require 'cinch/wit'

bot = Cinch::Bot.new do
    configure do |c|
        c.plugins.plugins << Cinch::Plugins::Wit
        c.plugins.options[Cinch::Plugins::Wit][:access_token] = 'YOUR_WIT_ACCESS_TOKEN'
    end

    # ...
end
```

You will have to train Wit before doing anything interesting. Here is an example
which handles Wit's default "Hello" and "Goodbye" intents:

``` ruby
bot = Cinch::Bot.new do
    # ...

    on :intent do |msg, outcome|
        response = case outcome['intent']
        when 'hello' then "Hello, #{msg.user}!"
        when 'good_bye' then "See you later, #{msg.user}."
        end
        msg.reply(response) unless response.nil?
    end
end
```

You can also enumerate `outcome['entities']` to get the entities, or check the confidence value
with `outcome['confidence']`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright © 2013 [Justin Workman](mailto:xtagon@gmail.com)

MIT License, see LICENSE.txt


[1]: https://wit.ai/
[2]: https://github.com/cinchrb/cinch
