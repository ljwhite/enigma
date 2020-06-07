require '../lib/encryption.rb'
require_relative 'test_helper.rb'

class EncryptionTest < Minitest::Test

  def test_it_can_split_key
    actual = Encryption.split_keys("02715")
    assert_equal [2,27,71,15], actual
  end

end
