module Factual
  class Crosswalk
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    #  optional parameters include: 
    #    limit: default is 50, must use OAuth to exceed
    #    only: namespace_id to restrict returns
    def search_by_factual_id(factual_id, optional = {})
      options = {:factual_id => factual_id}
      process(options, optional)
    end
    
    #  optional parameters include: 
    #    limit: default is 50, must use OAuth to exceed
    #    only: namespace_id to restrict returns
    def search_by_namespace(namespace, namespace_id, optional = {})
      options = {:namespace => namespace, :namespace_id => namespace_id}
      process(options, optional)
    end
    
    def namespaces
        [
            "allmenus",
            "allpages",
            "aol",
            "chow",
            "citysearch",
            "dexknows",
            "explore_to",
            "facebook",
            "foursquare",
            "fwix",
            "gogobot",
            "gowalla",
            "greatschools",
            "grubhub",
            "hotelscombined",
            "hunch",
            "insiderpages",
            "loopt",
            "manta",
            "menupages",
            "menupix",
            "menuplatform",
            "merchantcircle",
            "openmenu",
            "opentable",
            "restaurants",
            "retailigence",
            "simplegeo",
            "superpages",
            "urbanspoon",
            "yahoolocal",
            "yellowbook",
            "yelp",
            "yp",
            "zagat"
        ]
    end
    
    private
    
    def process(options, optional)
      options.merge!(optional) unless optional.blank?
      PlacesResponse.new(@client.class.get('/places/crosswalk', :query => options))
    end
  
  end
end