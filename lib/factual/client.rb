module Factual
  class Client
    
    include HTTParty
    base_uri 'api.v3.factual.com'
    format :json
    
    def initialize(factual_key)
      self.class.default_params :KEY => factual_key
    end
    
  end
end