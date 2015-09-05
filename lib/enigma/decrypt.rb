require_relative 'cipher'
require_relative 'rotation_key'

module Enigma
  class Decryptor

    def decrypt_letter(letter, rotated)
      new_cipher = Cipher.new
      cipher_for_rotation = new_cipher.cipher(rotated)    
      cipher_for_rotation.key(letter)
    end

    def decrypt(secret, secret_key, secret_date)
      secret_array = (secret).split("").each_slice(4).to_a
      new_rotation = Rotation.new
      cipher_array = new_rotation.rotate_key(secret_key,secret_date)
      puts cipher_array

      result = secret_array.collect do |arr|
        new_array = Hash[cipher_array.zip(arr)]
        puts new_array
        results = new_array.collect do |letter, rotation|
          encrypted_letter = decrypt_letter(rotation, letter)
        end
        results.join
      end
      result.join
    end

  end
end