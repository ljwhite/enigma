require '../lib/encryption.rb'
require_relative 'test_helper.rb'

class EncryptionTest < Minitest::Test

  def test_it_can_split_key
    actual = Encryption.split_keys("02715")
    assert_equal [2,27,71,15], actual
  end

  def test_it_can_create_offset
    actual = Encryption.create_offset("040895")
    assert_equal [1,0,2,5], actual
  end

  def test_final_shift
    actual = Encryption.final_shift([2,27,71,15], [1,0,2,5])
    expected = [3,27,73,20]
    assert_equal expected, actual
  end

  def test_it_can_encrypt
    actual = Encryption.encrypt("hello world", [3,27,73,20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

end
