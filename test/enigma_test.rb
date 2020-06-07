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
    assert_equal [3,27,73,20], actual
  end

end
