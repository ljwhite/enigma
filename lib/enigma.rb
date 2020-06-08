require_relative '../lib/encryption.rb'

class Enigma
include Encryption

  def encrypt(message, key = nil, date = nil)
    date = Encryption.date_today unless date
    key = Encryption.generate_key unless key

    shift = Encryption.final_shift(
      Encryption.split_keys(key),
      Encryption.create_offset(date)
      )
    message_encrypted = Encryption.encrypted_message(message, shift)
    hash = {encryption: message_encrypted,
            key: key,
            date: date
          }
    hash
  end

  def decrypt(cipher, key, date = nil)
    date = Encryption.date_today unless date
    shift = Encryption.final_shift(
      Encryption.split_keys(key),
      Encryption.create_offset(date)
    )
    message_decrypted = Encryption.decrypted_message(cipher, shift)
    hash = {decryption: message_decrypted,
            key: key,
            date: date
          }
    hash
  end

end
