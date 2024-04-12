[![Gem Version](https://badge.fury.io/rb/lightcast-ruby.svg)](https://badge.fury.io/rb/lightcast-ruby)
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/riipen/lightcast-ruby/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/riipen/lightcast-ruby/tree/main)

# Lightcast Ruby

An API client for the Lightcast REST APIs in ruby.

Lightcast Classification APIs documentation can be found here:

https://docs.lightcast.dev/apis/classification

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
  scope: 'classifications_api',
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
client.skills(version: '9.0.0', release: '2024.7')
```

where the optional version is any valid version.

#### Skills Extract

Extract skills from plain text.

```ruby
skills.extract(text:'computer science is a cool thing to study')
```

[API docs](https://docs.lightcast.dev/apis/classification#post-extract-skills)

#### Skills Get

Get a single skill.

```ruby
client.skills.get(123)
```

[API docs](https://docs.lightcast.dev/apis/classification#get-get-a-concept-by-id)

#### Skills List

List skills.

```ruby
client.skills.post(
   fields: ['name'],
   filter: {
     level: ['2'],
     id: [
      "someId",
      "anotherId"
     ]
   },
   limit: 5)
```

[API docs](https://docs.lightcast.dev/apis/classification#post-list-requested-taxonomy-concepts)

#### Skills Related

Get related skills from provided skills.

```ruby
client.related.get(ids: ['12345', 'abcde'], relationType: 'sibling')
```

[API docs](https://docs.lightcast.dev/apis/classification#post-list-requested-taxonomy-concepts)

#### Skills Status

Get the status of the classifications API.

```ruby
client.skills.status
```

[API docs](https://docs.lightcast.dev/apis/classification#get-get-service-status)

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
