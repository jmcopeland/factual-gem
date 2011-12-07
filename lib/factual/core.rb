module Factual
  class Core
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def schema_for_table(table)
      CoreResponse.new(@client.class.get("/t/#{table}/schema"))
    end
      
  end
end