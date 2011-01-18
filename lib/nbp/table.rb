module Nbp
  class Table
    include HTTParty
    base_uri "http://nbp.pl/kursy/xml"

    attr_reader :index

    def initialize(type = "a")
      @index = self.class.index_of(type.downcase)
    end

    def latest
      self.class.show(index.last)
    end

    def after(table_id)
      index.select { |id| index.index(id) > index.index(table_id) }
    end

    def before(table_id)
      index.select { |id| index.index(id) < index.index(table_id) }
    end
    
    def self.index
      get("/dir.txt").split("\r\n")
    end
    
    def self.index_of(type)
      index.select { |table_id| table_id.start_with?(type) }
    end
    
    def self.show(table_id)
      get("/#{table_id}.xml").parsed_response
    end

  end
end
