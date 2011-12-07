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
    
    def error?
        @body.status == "error"
    end
    
    def error_message
       @body.message if error?
    end
    
    def error_type
       @body.error_type if error?
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
    
    def resolved?
        success? && data.present? && data[0].resolved
    end
    
    def resolved_venue
        data[0] if resolved?
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