module Casica
  class Request
    def initialize(token: token)
      @token = token
    end

    def request(method, path, *args)
      connection.send(method, full_url(path), args, headers)
    end

    def headers
      {
        'Authorization' => "Bearer #{@token}",
        'ContentType' => 'application/json'
      }
    end

    def full_url(path)
      "#{base_url}#{path}"
    end

    def base_url
      @base_url ||= ENV['CASICA_BASE_URL'] || 'https://casica.io/api'
    end

    def connection
      @connection ||= Faraday.new do |config|
        config.request :json
        config.response :json
        config.adapter Faraday.default_adapter
      end
    end
  end
end
