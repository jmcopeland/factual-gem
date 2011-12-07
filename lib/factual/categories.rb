module Factual
  class Categories

      include HTTParty
        
      def list
        CategoriesResponse.new(get('http://developer.factual.com/download/attachments/1310739/categories_heir.json?version=10&modificationDate=1321655545493'))
      end
    
  end
end