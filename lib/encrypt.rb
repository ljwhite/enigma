require_relative '../lib/enigma.rb'
require_relative '../lib/encryption.rb'
require 'date'

class EncryptRunner < Enigma
include Encryption

  def initialize
    @message = File.open(ARGV[0])
    @encrypted_message = File.open(ARGV[1],"w")
    @enigma = Enigma.new
  end

  def encrypt_message
    date = date_today
    key = generate_key

    shift = final_shift(
      split_keys(key),
      create_offset(date)
      )

    @message.each_line do |line|
      @encrypted_message.write(Encryption.encrypted_message(line, shift))
    end
    puts "Created encrypted.txt with the key #{key} and the date #{date}."
  end

end

encrypt_runner = EncryptRunner.new
encrypt_runner.encrypt_message
