require_relative 'cipher'
require_relative 'rotation_key'

module Enigma
  class Encryptor
    def encrypt_letter(letter, rotated)
      new_cipher = Cipher.new
      cipher_for_rotation = new_cipher.cipher(rotated)    
      cipher_for_rotation[letter]
    end

    def encrypt(input_string)
      rotation = rand(10000..99999).to_s
      todays_date = Time.now.strftime("%d%m%y")
      rotator = Rotation.new
      grouped_input_string = (input_string).downcase.split("").each_slice(4).to_a   
      result = grouped_input_string.collect do |arr|
        rotation_hash = rotator.construct_rotation_hash(rotation, todays_date, arr)
        results = rotation_hash.collect do |letter, rotation|
          encrypted_letter = encrypt_letter(rotation, letter)
         end
        results.join
       end
       {
        text: result.join,
        key: rotation,
        date: todays_date
       }
    end

  end
end

e = Enigma::Encryptor.new
e.encrypt("hello..end..")