require_relative 'test_helper.rb'
require_relative '../lib/encrypt.rb'
require_relative '../lib/enigma.rb'
require_relative '../lib/encryption.rb'

require 'mocha/minitest'

class EncryptRunnerTest < Minitest::Test

  def setup
    @message = mock
    @encrypted_message = mock
    @encrypt = EncryptRunner.new
  end

  def test_it_exists
    @encrypt.stubs(:message).returns("hellow orld ")
    @encrypt.stubs(:encrypted_message).returns("encrypted")
    assert_instance_of EncryptRunner, @encrypt
  end

  def test_it_has_readable_attributes
skip
      @encrypt.stubs(:message).returns("hello world")
      binding.pry
      @encrypt.stubs(:date_today).returns("040895")
      @encrypt.stubs(:generate_key).returns("02715")
      @encrypt.encrypt_message_alt
      assert_equal @encrypted_message, "ljsdfl"
  end

  # def test_it_exists
  #   skip
  #   @encrypt.stubs(:message).returns("hello world")
  #   assert_equal "hello world", @encrypt.message
  # end
end
