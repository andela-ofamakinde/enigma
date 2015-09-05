require_relative 'cipher'
require_relative 'rotation_key'

module Enigma
  class Encryptor
    def encrypt_letter(letter, rotation)
      new_cipher = Cipher.new
      cipher_for_rotation = new_cipher.cipher(rotation)    
      cipher_for_rotation[letter]
    end

    def encrypt(message)
      messgae_array = (message).split("").each_slice(4).to_a
      rotation_key = rand.to_s[2..6]
      puts "this is " + "#{rotation_key}"
      date = Time.now.strftime("%d%m%y")

      new_rotation = Rotation.new

      cipher_array = new_rotation.rotate_key(rotation_key,date)
      puts cipher_array

      result = messgae_array.collect do |arr|
        new_array = Hash[cipher_array.zip(arr)]
        puts new_array
        results = new_array.collect do |letter, rotation|
          encrypted_letter = encrypt_letter(rotation, letter)
        end
        results.join
      end
      result.join
    end

  end
end