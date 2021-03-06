require_relative '../lib/encryption.rb'
require 'date'

class Enigma
include Encryption

  def encrypt(message, key = nil, date = nil)
    date = date_today unless date
    key = generate_key unless key
    shift = shift(key, date)
    message_encrypted = encrypted_message(message, shift)
    {
      encryption: message_encrypted,
      key: key,
      date: date
    }
  end

  def decrypt(cipher, key, date = nil)
    date = date_today unless date
    shift = shift(key, date)
    message_decrypted = decrypted_message(cipher, shift)
    {
      decryption: message_decrypted,
      key: key,
      date: date
    }
  end

end
