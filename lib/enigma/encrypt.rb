require_relative 'cipher'
require_relative 'rotation_key'

module Enigma
  class Encryptor
    def encrypt_letter(letter, cipher_for_rotation)
      cipher_for_rotation[letter]
    end

    def encrypt(message)
      message_array = (message).downcase.split("").each_slice(4).to_a
      rotation_key = rand.to_s[2..6]
      puts "this is " + "#{rotation_key}"
      date = Time.now.strftime("%d%m%y")
      new_rotation = Rotation.new
      rotation_array = new_rotation.rotate_key(rotation_key,date)
      cipher_array = cipher(rotation_array)
      # puts cipher_array
      index = 0
      results = message_array.collect do |arr|
        index = 0
        result = arr.collect do |letter|
          index = index > 2 ? 0 : index + 1
          encrypt_letter(letter, cipher_array[index])
        end
        result
      end
      results.join
    end

    def cipher(rotation_array)
      new_cipher = Cipher.new
      cipher_array = []
      rotation_array.each do |rotation|
        cipher_array << new_cipher.cipher(rotation)
      end
      cipher_array
    end


  end
end