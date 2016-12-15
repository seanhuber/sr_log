# sr_log

**sr_log** is a simple wrapper method around ruby's native `Logger` class. It allows you to write to multiple custom logfiles and serves the purpose of log rotation by prefixing the logfiles with a month stamp.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sr_log'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sr_log

## Usage

To write to a logfile, call the global `sr_log` method.  For example:

```ruby
sr_log :user_updates, "This is my message"
```

`sr_log` will create a `./log/2016_12_user_updates.log` file if one does not already exist (except that it will use current year/month for the prefix).  Then it will write the line "This is my message" to the logfile.

Optionally you can pass named arguments to the `sr_log` method:

Argument: `:dir`, type: `string`. Use `:dir` to set a custom path for where the logfile is saved.

Argument: `:current_user`, type: `Object`. Use `:current_user` to specify that the message is being logged by a use.  This will add a `"Logged by user: #{current_user}"` line to the logfile before the message.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
