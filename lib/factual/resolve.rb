module Factual
  class Resolve
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def values(params)
      values = params.to_json
      PlacesResponse.new(@client.class.get('/places/resolve', :query => values))
    end
      
  end
end