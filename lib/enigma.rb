require_relative '../lib/encryption.rb'

class Enigma
include Encryption

  def encrypt(message, key, date)
    split_key = Encryption.split_keys(key)
    offset = Encryption.create_offset(date)
    Encryption.final_shift(split_key, offset)
  end
end
