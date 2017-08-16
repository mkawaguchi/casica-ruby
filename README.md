# Casica

Casica API Ruby Wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'casica'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install casica

## Usage

see also: [https://casica.io/api_doc](https://casica.io/api_doc)

### Initialize

```ruby
client = Casica::Client.new(token: "<access_token>")
```

### Project API

#### GET /api/projects

```ruby
client.projects
```

### Story API

#### GET /api/projects/<project_id>/stories

```ruby
client.stories(project_id: <project_id>)
```

#### POST /api/projects/<project_id>/stories

```ruby
client.create_story(project_id: <project_id>, attributes: { title: 'Story Title' })
```

#### PATCH /api/projects/<project_id>/stories/<story_serial_num>

```ruby
client.update_story(project_id: <project_id>, story_serial_num: <story_serial_num>, attributes: { title: 'Updated Story Title' })
```

#### DELETE /api/projects/<project_id>/stories/<story_serial_num>

```ruby
client.destroy_story(project_id: <project_id>, story_serial_num: <story_serial_num>)
```

#### PATCH /api/projects/<project_id>/stories/statuses

```ruby
client.update_story_status(project_id: <project_id>, from_status: 'merged', to_status: 'stg_deployed')
```

### Task API

#### GET /api/projects/<project_id>/stories/<story_serial_num>/tasks

```ruby
client.tasks(project_id: <project_id>, story_serial_num: <story_serial_num>)
```

#### POST /api/projects/<project_id>/stories/<story_serial_num>/tasks

```ruby
client.create_task(project_id: <project_id>, story_serial_num: <story_serial_num>, attributes: { title: 'Task Title' })
```

#### PATCH /api/projects/<project_id>/stories/<story_serial_num>/tasks/<task_serial_num>

```ruby
client.update_task(project_id: <project_id>, story_serial_num: <story_serial_num>, task_serial_num: <task_serial_num>, attributes: { title: 'Updated Task Title' })
```

#### DELETE /api/projects/<project_id>/stories/<story_serial_num>/tasks/<task_serial_num>

```ruby
client.destroy_task(project_id: <project_id>, story_serial_num: <story_serial_num>, task_serial_num: <task_serial_num>)
```

#### PATCH /api/projects/<project_id>/tasks/statuses

```ruby
client.update_task_status(project_id: <project_id>, from_status: 'merged', to_status: 'stg_deployed')
```

## Contributing

1. Fork it ( https://github.com/startup-technology/casica-ruby/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
