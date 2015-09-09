require_relative 'cipher'
require_relative 'rotation_key'

module Enigma
  class Decryptor

    def decrypt_letter(letter, rotated)
      new_cipher = Cipher.new
      cipher_for_rotation = new_cipher.cipher(rotated)    
      cipher_for_rotation.key(letter)
     end

    def decrypt(input_string, enc_key, enc_date)
      grouped_input_array = (input_string).downcase.split("").each_slice(4).to_a
      rotator = Rotation.new
      result = grouped_input_array.collect do |arr|
        rotation_hash = rotator.construct_rotation_hash(enc_key, enc_date, arr)
        results = rotation_hash.collect do |letter, rotation|
          encrypted_letter = decrypt_letter(rotation, letter)
       end
       results.join
      end
        message = {
          text: result.join,
          key: enc_key,
          date: enc_date
       }
    end

  end
end

str = ARGV[0] || str
enc_key = ARGV[1] || enc_key
enc_date = ARGV[2] || enc_date
d = Enigma::Decryptor.new
d.decrypt(str, enc_key, enc_date) if enc_date