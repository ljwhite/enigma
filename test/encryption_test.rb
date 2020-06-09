require_relative 'test_helper.rb'
require_relative '../lib/encryption.rb'

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

  def test_it_can_create_shift_in_one_method
    key = "02715"
    date = "040895"
    expected = [3,27,73,20]
    actual = Encryption.shift(key,date)
    assert_equal expected, actual
  end

  def test_it_can_encrypt
    actual = Encryption.encrypted_message("hello world", [3,27,73,20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

  def test_it_can_encrypt_uppercase_characters
    actual = Encryption.encrypted_message("HeLLO WorLD", [3, 27, 73, 20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

  def test_it_can_handle_invalid_characters
    actual = Encryption.encrypted_message("hello, world", [3, 27, 73, 20])
    expected =  "keder,sprrdx"
    assert_equal expected, actual
  end

  def test_it_can_generate_random_5_digit_key
    actual = Encryption.generate_key
    assert_equal 5, actual.length
  end

  def test_it_can_provide_todays_date
    expected = "060820"
    stubs(:date_today).returns("060820")
    actual = Encryption.date_today
    assert_equal expected, actual
  end

  def test_it_can_decrypt
    expected = "hello world"
    actual = Encryption.decrypted_message("keder ohulw", [3,27,73,20])
    assert_equal expected, actual
  end

  def test_decryption_can_ignore_invalid_characters
    expected = "hello, world"
    actual = Encryption.decrypted_message("keder,sprrdx", [3,27,73,20])
    assert_equal expected, actual
  end

  def test_it_can_prepare_message
    message = "HelLo!"
    expected = ["h","e","l","l","o","!"]
    actual = Encryption.prepare_message(message)
    assert_equal expected, actual 
  end

end
