require 'minitest/autorun'
require 'minitest/color'
require_relative 'binary_search_tree'

class BstTest < Minitest::Test

  def test_data_is_retained
    assert_equal 4, Bst.new(4).data
  end

  def test_inserting_less
    four = Bst.new 4
    four.insert 2
    assert_equal 4, four.data
    assert_equal 2, four.left.data
  end

  def test_inserting_same
    four = Bst.new 4
    four.insert 4
    assert_equal 4, four.data
    assert_equal 4, four.left.data
  end

  def test_inserting_right
    four = Bst.new 4
    four.insert 5
    assert_equal 4, four.data
    assert_equal 5, four.right.data
  end

  def test_complex_tree
    skip
    four = Bst.new 0
    four.insert 1
    four.insert 2
    four.insert 3
    four.insert 4
    four.insert 5
    four.insert 6
    four.insert 7
    four.insert 8
    four.insert 9
    four.insert 10
    assert_equal 4, four.data
    assert_equal 2, four.left.data
    assert_equal 1, four.left.left.data
    assert_equal 3, four.left.right.data
    assert_equal 6, four.right.data
    assert_equal 5, four.right.left.data
    assert_equal 7, four.right.right.data
  end

  def record_all_data(bst)
    all_data = []
    bst.each { |data| all_data << data }
    # require "pry"; binding.pry
    all_data
  end

  def test_iterating_one_element
    assert_equal [4], record_all_data(Bst.new(4))
  end

  def test_iterating_over_smaller_element
    four = Bst.new 4
    four.insert 2
    assert_equal [2, 4], record_all_data(four)
  end

  def test_iterating_over_larger_element
    four = Bst.new 4
    four.insert 5
    assert_equal [4, 5], record_all_data(four)
  end

  def test_iterating_over_complex_tree
    zero = Bst.new 7
    zero.insert 1
    zero.insert 0
    zero.insert 3
    zero.insert 2
    zero.insert 5
    zero.insert 4
    zero.insert 6
    zero.insert 9
    zero.insert 8
    zero.insert 10
    assert_equal [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], record_all_data(zero)
  end

  def test_each_returns_enumerator_if_no_block
    tree = Bst.new 4
    [2, 1, 3, 6, 7, 5].each { |x| tree.insert x }
    each_enumerator = tree.each

    assert_kind_of Enumerator, each_enumerator

    (1..7).each { |x| assert_equal(x, each_enumerator.next) }

    assert_raises(StopIteration) { each_enumerator.next }
  end
end
