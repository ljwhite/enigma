require_relative 'test_helper.rb'
require_relative '../lib/enigma.rb'

require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_can_encrypt_string
    actual = @enigma.encrypt("hello world", "02715", "040895")
    expected =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }
    assert_equal expected, actual
  end

  def test_encryption_can_generate_date
    actual = @enigma.encrypt("hello world", "02715")
    expected =  "060820"
    assert_equal expected, actual[:date]
  end

  def test_encryption_can_generate_key
    @enigma.stubs(:generate_key).returns("02715")
    actual = @enigma.encrypt("hello world")
    assert_equal 5, actual[:key].length
    assert_equal "02715", actual[:key]
  end

  def test_it_can_encrypt_with_only_message
    @enigma.stubs(:date_today).returns("040895")
    @enigma.stubs(:generate_key).returns("02715")
    actual = @enigma.encrypt("hello world")
    expected =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }
    assert_equal expected, actual
  end

  def test_it_can_decrypt
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, actual
  end

end
