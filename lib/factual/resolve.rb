module Factual
  class Resolve
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def search_by_values(params)
      values = params.to_json
      PlacesResponse.new(@client.class.get('/places/resolve', :query => {:values => values}))
    end
      
  end
end