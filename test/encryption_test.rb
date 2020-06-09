require_relative '../test_helper.rb'
require_relative '../lib/encryption.rb'

class EncryptionTest < Minitest::Test
include Encryption

  def test_it_can_split_key
    actual = split_keys("02715")
    assert_equal [2,27,71,15], actual
    assert_equal [0, 0, 0, 0], split_keys("00000")
    actual = split_keys("0271")
    refute actual
  end

  def test_character_set_is_valid
    collection = character_set
    assert_includes collection, "a"
    refute_includes collection, "!"
    refute_includes collection, "A"
    refute_includes collection, 5
    assert_instance_of Array, collection
  end

  def test_it_can_create_offset
    actual = create_offset("040895")
    assert_equal [1,0,2,5], actual
    actual = create_offset("0506956")
    refute actual
    actual = create_offset("130895")
    refute actual
    actual = create_offset("114295")
    refute actual
  end

  def test_final_shift
    actual = final_shift([2,27,71,15], [1,0,2,5])
    expected = [3,27,73,20]
    assert_equal expected, actual
  end

  def test_it_can_create_shift_in_one_method
    key = "02715"
    date = "040895"
    expected = [3,27,73,20]
    actual = shift(key,date)
    assert_equal expected, actual
  end

  def test_it_can_encrypt
    actual = encrypted_message("hello world", [3,27,73,20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

  def test_it_can_encrypt_uppercase_characters
    actual = encrypted_message("HeLLO WorLD", [3, 27, 73, 20])
    expected =  "keder ohulw"
    assert_equal expected, actual
  end

  def test_it_can_handle_invalid_characters
    actual = encrypted_message("hello, world", [3, 27, 73, 20])
    expected =  "keder,sprrdx"
    assert_equal expected, actual
    actual = encrypted_message("123456789", [3, 27, 73,20])
    expected = "123456789"
    assert_equal expected, actual
  end

  def test_it_can_generate_random_5_digit_key
    actual = generate_key
    assert_equal 5, actual.length
    stubs(:generate_key).returns("02715")
    actual = generate_key
    assert_equal "02715", actual
  end

  def test_it_can_provide_todays_date
    expected = "060820"
    stubs(:date_today).returns("060820")
    actual = date_today
    assert_equal expected, actual
  end

  def test_it_can_decrypt
    expected = "hello world"
    actual = decrypted_message("keder ohulw", [3,27,73,20])
    assert_equal expected, actual
  end

  def test_decryption_can_ignore_invalid_characters
    expected = "hello, world"
    actual = decrypted_message("keder,sprrdx", [3,27,73,20])
    assert_equal expected, actual
  end

  def test_it_can_prepare_message
    message = "HelLo!"
    expected = ["h","e","l","l","o","!"]
    actual = prepare_message(message)
    assert_equal expected, actual
  end

end
