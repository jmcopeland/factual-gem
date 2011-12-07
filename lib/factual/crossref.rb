module Factual
  class Crossref
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    #  optional parameters include: 
    #    limit: default is 500, must use OAuth to exceed
    def search_by_factual_id(factual_id, optional = {})
      options = {:factual_id => factual_id}
      process(options, optional)
    end
    
    #  optional parameters include: 
    #    limit: default is 500, must use OAuth to exceed
    def search_by_url(url, optional = {})
      options = {:url => url}
      process(options, optional)
    end
    
    private
    
    def process(options, optional)
      options.merge!(optional) unless optional.blank?
      PlacesResponse.new(@client.class.get('/places/crossref', :query => options))
    end
  
  end
end