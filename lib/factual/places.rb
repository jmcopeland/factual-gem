module Factual
  class Places
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end

    # http://developer.factual.com/display/docs/Core+API+-+Read
    # Optional parameters:
    #   filters: http://developer.factual.com/display/docs/Core+API+-+Row+Filters
    #   include_count: default is false
    #   facet: comma seperated list of fields; returns counts grouped by distinct fields
    #   geo: send a hash {:latitude => lat, :longitude => lng, :radius => rad}
    #   limit: default is 20, max is 50
    #   q: full-text search, "sushi bar" searches for sushi AND bar; "sushi,bar" searches sushi OR bar
    #   offset
    #   select: fields to include in the query response
    #   sort: field_name:(asc|desc), $distance:(asc|desc), or $relevance:(asc|desc)
    
    def search_table(table_id, optional = {})
      optional[:geo] = create_geo_filter(optional[:geo]) if optional[:geo]
      PlacesResponse.new(@client.class.get("/t/#{table_id}", :query => optional))
    end
    
    private
    def create_geo_filter(geo_hash)
        return "{'$circle':{'$center':[#{geo_hash['latitude']}, #{geo_hash['longitude']}],'$meters':#{geo_hash['radius']}}}".to_json
    end
      
  end
end