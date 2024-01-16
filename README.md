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

Create your client

```ruby
client = Lightcast::Client.new(
  client_id: '123ABC'
  client_secret: '456DEF'
  scope: 'profiles:us',
)
```

and then create an authentication token that lasts 1 hour

```ruby
client.authenticate
```

Now you can make use of any of your available APIs for your client.

### Skills API

You can access the skills API via

```ruby
client.skills(version: 'latest')
```

where the optional version is any valid version.

#### Skills Extract

Extract skills from plain text.

```ruby
client.skills.extract({ text: 'blah blah blah' }, { language: 'en', confidence_threshold: 0.5 })
```

[API docs](https://docs.lightcast.dev/apis/skills#versions-version-extract)

#### Skills Get

Get a single skill.

```ruby
client.skills.get(123)
```

[API docs](https://docs.lightcast.dev/apis/skills#versions-version-skills-skill_id)

#### Skills Related

Get related skills from provided skills.

```ruby
client.related.get(ids: ['12345', 'abcde'])
```

[API docs](https://docs.lightcast.dev/apis/skills#versions-version-related)

#### Skills Status

Get the status of the skills API.

```ruby
client.skills.status
```

[API docs](https://docs.lightcast.dev/apis/skills#status)

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