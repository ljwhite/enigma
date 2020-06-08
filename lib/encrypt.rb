require_relative '../lib/enigma.rb'
require_relative '../lib/encryption.rb'
require 'date'

class EncryptRunner < Enigma
include Encryption

  def initialize
    @message_in = File.open(ARGV[0])
    @message_out = File.open(ARGV[1],"w")
    @enigma = Enigma.new
  end

  def encrypt_message
    date = date_today
    key = generate_key
    shift = shift(key, date)

    @message_in.each_line do |line|
      @message_out.write(encrypted_message(line, shift))
    end
    puts "Created #{ARGV[1]} with the key #{key} and the date #{date}."
  end
end

encrypt_runner = EncryptRunner.new
encrypt_runner.encrypt_message
