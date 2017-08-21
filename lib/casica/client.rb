module Casica
  class Client
    def initialize(token:)
      @token = token
    end

    def projects
      api(:get, '/projects', :get)
    end

    def stories(project_id:)
      api(:get, "/projects/#{project_id}/stories")
    end

    def tasks(project_id:, story_serial_num:)
      api(:get, "/projects/#{project_id}/stories/#{story_serial_num}/tasks")
    end

    def create_story(project_id:, attributes: {})
      api(:post, "/projects/#{project_id}/stories", story: attributes)
    end

    def update_story(project_id:, story_serial_num:, attributes: {})
      api(:patch, "/projects/#{project_id}/stories/#{story_serial_num}", story: attributes)
    end

    def destroy_story(project_id:, story_serial_num:)
      api(:delete, "/projects/#{project_id}/stories/#{story_serial_num}")
    end

    def update_story_status(project_id:, from_status:, to_status:)
      api(:patch, "/projects/#{project_id}/stories/statuses", status: { from_status: from_status, to_status: to_status })
    end

    def create_task(project_id:, story_serial_num:, attributes: {})
      api(:post, "/projects/#{project_id}/stories/#{story_serial_num}/tasks", task: attributes)
    end

    def update_task(project_id:, story_serial_num:, task_serial_num:, attributes: {})
      api(:patch, "/projects/#{project_id}/stories/#{story_serial_num}/tasks/#{task_serial_num}", task: attributes)
    end

    def destroy_task(project_id:, story_serial_num:, task_serial_num:)
      api(:delete, "/projects/#{project_id}/stories/#{story_serial_num}/tasks/#{task_serial_num}")
    end

    def update_task_status(project_id:, from_status:, to_status:)
      api(:patch, "/projects/#{project_id}/tasks/statuses", status: { from_status: from_status, to_status: to_status })
    end

    private

    def api(method, path, args)
      Casica::Response.new(request.send(:request, method, path, args)).response
    end

    def request
      @request ||= Casica::Request.new(token: @token)
    end
  end
end
