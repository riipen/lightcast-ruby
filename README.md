# Lightcast Ruby

An API client for the Lightcast REST APIs in ruby.

Lightcast APIs documentation can be found here:

https://docs.lightcast.dev/apis

## Installation

Add to your `Gemfile`:

```ruby
gem 'lightcast-ruby'
```

Then `bundle install`.

## Usage

### Quick Start

The Lightcast API uses OAuth to authenticate API requests. All endpoints require an OAuth bearer token. Tokens are granted through the Authentication API and are valid for 1 hour. 

```ruby
client = Lightcast::Client.new(
  client_id: '123ABC'
  client_secret: '456DEF'
  scope: 'profiles:us',
)
```

### Errors

Any error code returned by the Lightcast API will result in one of the following expections

|Code|Exception|
|----|---------|
|400| Lightcast::BadRequest|
|401| Lightcast::Unauthorized|
|403| Lightcast::Forbidden|
|404| Lightcast::NotFound|
|410| Lightcast::Gone|
|4xx| Lightcast::ClientError|
|500| Lightcast::InternalServerError|
|503| Lightcast::ServiceUnavailable|
|5xx| Lightcast::ServerError|

## License

Copyright (C) 2023 Riipen. See [LICENSE](https://github.com/riipen/lightcast-ruby/blob/master/LICENSE.md) for details.