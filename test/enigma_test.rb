require_relative '../lib/enigma.rb'
require_relative 'test_helper.rb'

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

  def test_it_can_generate_date
    actual = @enigma.encrypt("hello world", "02715")
    expected =  "060820"
    assert_equal expected, actual[:date]
  end

  def test_it_can_generate_key
    actual = @enigma.encrypt("hello world")
    expected =  "05563"
    assert_equal expected.length, actual[:key].length 
  end

end
