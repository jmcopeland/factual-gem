module Factual
  class CoreResponse
    
    attr_accessor :body
    
    def initialize(response)
        @body = rash_response(response)
    end
    
    def version
        @body.version
    end
    
    def status
        @body.status
    end
    
    def success?
        @body.status == "ok"
    end
    
    def error_message
      # @body.message.text unless success?
    end
        
    def schema
        if !@body.response.view.blank?
            @body.response.view
        end
    end
    
    private
    
    def rash_response(response)
      if response.is_a?(Array)
        @body = []
        response.each do |b|
          if b.is_a?(Hash)
            @body << Hashie::Rash.new(b)
          else
            @body << b
          end
        end
      elsif response.is_a?(Hash)
        @body = Hashie::Rash.new(response)
      else
        @body = response
      end
    end
    
  end
end