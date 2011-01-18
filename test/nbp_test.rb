require 'helper'

class NbpTest < Test::Unit::TestCase
  
  def test_index_tables
    assert Nbp::Table.index.size > 0
    assert_equal "a001z020102", Nbp::Table.index.first
  end
  
  def test_show_table
    quote_a048z090310 = Nbp::Table.show("a048z090310")
    body = quote_a048z090310["tabela_kursow"]
    
    assert_equal "A",             body["typ"]
    assert_equal "2009-03-10",    body["data_publikacji"]
    assert_equal "48/A/NBP/2009", body["numer_tabeli"]
    assert_equal "09a048",        body["uid"]
  end

  def test_tables_index_of_given_type
    table_a = Nbp::Table.new("A")
    table_b = Nbp::Table.new("B")
    table_c = Nbp::Table.new("C")
    
    assert table_a.index.size > 0
    assert table_b.index.size > 0
    assert table_c.index.size > 0
  end
  
  def test_latest_quote_of_given_type
    table_a = Nbp::Table.new("A")
    assert_equal "A", table_a.latest["tabela_kursow"]["typ"]
  end
  
  def test_list_quotes_before_given
    table_a = Nbp::Table.new("A")
    assert_equal 1817, table_a.before("a048z090310").size
  end
  
  def test_list_quotes_after_given
    table_a = Nbp::Table.new("A")
    assert table_a.after("a048z090310").size >= 473
  end
  
end
