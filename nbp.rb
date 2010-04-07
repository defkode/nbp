class NbpTable
  include HTTParty
  base_uri "http://nbp.pl/kursy/xml"
  
  attr_reader :tables
  
  def initialize(type = "a")
    @tables = filtered_tables(type.downcase)
  end
  
  def latest
    show(tables.last)
  end
  
  def show(table_id)
    self.class.get("/#{table_id}.xml")
  end
  
  def after(table_id)
    tables.select { |id| tables.index(id) > tables.index(table_id) }
  end
  
  def before(table_id)
    tables.select { |id| tables.index(id) < tables.index(table_id) }
  end
  
  protected
  
  def published_tables
    self.class.get("/dir.txt").split("\r\n")
  end
  
  def filtered_tables(type) 
    published_tables.select { |table_id| table_id.start_with?(type) }
  end
  
end