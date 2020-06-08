require_relative '../lib/encryption.rb'
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
    actual = Encryption.encrypted_message("hello world", [3,27,73,20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

  def test_it_can_encrypt_uppercase_characters
    actual = Encryption.encrypted_message("HELLO WORLD", [3, 27, 73, 20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

  def test_it_can_handle_invalid_characters
    actual = Encryption.encrypted_message("hello, world", [3, 27, 73, 20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

  def test_it_can_generate_random_5_digit_key
    actual = Encryption.generate_key
    assert_equal 5, actual.length
  end

  def test_it_can_provide_todays_date
    expected = "060720"
    actual = Encryption.date_today
    assert_equal expected, actual
  end

end
