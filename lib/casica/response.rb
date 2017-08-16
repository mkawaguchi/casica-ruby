module Casica
  class Response
    def initialize(faraday_response)
      @faraday_response = faraday_response
    end

    def method_missing(method, *args, &block)
      return @faraday_response.send(method, *args, &block) if @faraday_response.respond_to?(method)
      super
    end

    def success?
      case @faraday_response.status
      when 200..299 then true
      when 400..499 then false
      when 500..599 then false
      else false
      end
    end

    def failure?
      !success?
    end

    def response
      if success?
        @faraday_response.body || true
      else
        Casica::Error.new(self)
      end
    end
  end
end