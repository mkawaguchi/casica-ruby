module Casica
  class Error
    attr_accessor :response

    def initialize(response)
      @response = response
    end
  end
end