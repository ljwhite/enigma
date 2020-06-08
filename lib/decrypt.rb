require_relative '../lib/enigma.rb'
require_relative '../lib/encryption.rb'
require 'date'

class DecryptRunner < Enigma
include Encryption

  def initialize
    @message_in = File.open(ARGV[0])
    @message_out = File.open(ARGV[1],"w")
    @enigma = Enigma.new
  end

  def decrypt_message
    date = ARGV[3]
    key = ARGV[2]

    shift = final_shift(
      split_keys(key),
      create_offset(date)
      )

    @message_in.each_line do |line|
      @message_out.write(Encryption.decrypted_message(line, shift))
    end
    puts "Created #{ARGV[1]} with the key #{key} and the date #{date}."
  end

end

decrypt_runner = DecryptRunner.new
decrypt_runner.decrypt_message
