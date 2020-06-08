require_relative '../lib/encryption.rb'

class Enigma
include Encryption

  def encrypt(message, key = key_omitted = true, date = date_omitted = true)
    date = Encryption.date_today if date_omitted
    key = Encryption.generate_key if key_omitted
    split_key = Encryption.split_keys(key)
    offset = Encryption.create_offset(date)
    shift = Encryption.final_shift(split_key, offset)
    message_encrypted = Encryption.encrypted_message(message, shift)
    hash = Hash.new{0}
    hash[:encryption] = message_encrypted
    hash[:key] = key
    hash[:date] = date
    hash
  end

end
