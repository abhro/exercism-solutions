# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'say'

# Common test data version: 1.2.0 a0cee46
class SayTest < Minitest::Test
  # make_my_diffs_pretty!

  def test_zero
    assert_equal 'zero', Say.in_english(0)
  end

  def test_one
    assert_equal 'one', Say.in_english(1)
  end

  def test_fourteen
    assert_equal 'fourteen', Say.in_english(14)
  end

  def test_twenty
    assert_equal 'twenty', Say.in_english(20)
  end

  def test_twenty_two
    assert_equal 'twenty-two', Say.in_english(22)
  end

  def test_one_hundred
    assert_equal 'one hundred', Say.in_english(100)
  end

  def test_one_hundred_twenty_three
    assert_equal 'one hundred twenty-three', Say.in_english(123)
  end

  def test_one_thousand
    assert_equal 'one thousand', Say.in_english(1_000)
  end

  def test_one_thousand_two_hundred_thirty_four
    expected = 'one thousand two hundred thirty-four'
    assert_equal expected, Say.in_english(1_234)
  end

  def test_one_million
    assert_equal 'one million', Say.in_english(1_000_000)
  end

  def test_one_million_two_thousand_three_hundred_forty_five
    expected = 'one million two thousand three hundred forty-five'
    assert_equal expected, Say.in_english(1_002_345)
  end

  def test_one_billion
    assert_equal 'one billion', Say.in_english(1_000_000_000)
  end

  def test_a_big_number
    expected =
      'nine hundred eighty-seven billion six hundred fifty-four million ' \
      'three hundred twenty-one thousand one hundred twenty-three'
    assert_equal expected, Say.in_english(987_654_321_123)
  end

  def test_numbers_below_zero_are_out_of_range
    assert_raises(ArgumentError) do
      Say.in_english(-1)
    end
  end

  def test_numbers_above_999_999_999_999_are_out_of_range
    assert_raises(ArgumentError) do
      Say.in_english(1_000_000_000_000)
    end
  end
end
