class Nbp
  include HTTParty
  base_uri "http://nbp.pl/kursy/xml"
  
  attr_accessor :type, :tables
  
  def initialize(type = "a")
    @type = type
    @tables = get_tables
  end
  
  def last_table
    id = tables.last
    get_table(id)
  end
  
  def at(id)
    self.class.get("/#{id}.xml")
  end
  
  def gt(id)
    tables.select { |x| tables.index(x) > tables.index(id) }
  end
  
  def lt(id)
    tables.select { |x| tables.index(x) < tables.index(id) }
  end
  
  protected
  
  def get_tables
    response = self.class.get("/dir.txt").split("\r\n")
    response.select { |x| x.starts_with?(type) }
  end
  
end