require_relative '../lib/encrypt.rb'
require_relative 'test_helper.rb'
require 'mocha/minitest'

class EncryptTest < Minitest::Test

  def setup
    @encrypt = EncryptRunner.new
  end

  def test_it_exists
    assert_instance_of EncryptRunner, @encrypt
  end

  # def test_it_exists
  #   skip
  #   @encrypt.stubs(:message).returns("hello world")
  #   assert_equal "hello world", @encrypt.message
  # end
end
