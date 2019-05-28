require 'helper'

class NbpTest < Test::Unit::TestCase

  def test_index_tables
    assert Nbp::Table.index.size > 0
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
end
