module Factual
  class PlacesResponse
    
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
    
    def included_rows
        @body.included_rows
    end
    
    def total_rows
        @body.total_row_count
    end
    
    def data
        if !@body.response.data.blank?
            @body.response.data
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