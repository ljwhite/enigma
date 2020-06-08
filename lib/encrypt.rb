require_relative '../lib/enigma.rb'
require_relative '../lib/encryption.rb'
require 'date'

class EncryptRunner < Enigma
include Encryption

attr_reader :message
  def initialize(message = "hello world", encrypted_message = "bhgjhg")
    @message = File.open(ARGV[0])
    @encrypted_message = File.open(ARGV[1],"w")
    @enigma = Enigma.new
  end

  def encrypt_message
    @message.each_line do |line|
      encrypted_line = @enigma.encrypt(line)
      @encrypted_message.write(encrypted_line)
    end
  end

  def write_new_file
    @message.each_line do |line|
      @encrypted_message.write(line.upcase)
    end
  end

  def encrypt_message_alt
    date = date_today
    key = generate_key

    shift = final_shift(
      split_keys(key),
      create_offset(date)
      )

    @message.each_line do |line|
      @encrypted_message.write(Encryption.encrypted_message(line, shift))
    end
  end

#  puts "Created #{ARGV[1]} with the key #{updated_message[:key]}."

end
#put in test
example = EncryptRunner.new
example.encrypt_message_alt
