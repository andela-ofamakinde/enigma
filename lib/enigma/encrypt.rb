require_relative 'cipher'
require 'pry'
require_relative 'rotation_key'

module Enigma
  class Encryptor
    def encrypt_letter(letter, rotated)
      new_cipher = Cipher.new
      cipher_for_rotation = new_cipher.cipher(rotated)    
      cipher_for_rotation[letter]
    end

    def encrypt(string)
      rotation = rand(10000..99999).to_s
      puts "this is " + "#{rotation}"
      dated = Time.now.strftime("%d%m%y")
      new_key = Rotation.new
      stringed = (string).downcase.split("").each_slice(4).to_a   
      result = stringed.collect do |arr|
        rotation_hash = new_key.break_key(rotation, dated, arr)
        results = rotation_hash.collect do |letter, rotation|
          encrypted_letter = encrypt_letter(rotation, letter)
         end
        results.join
       end
       p result.join
    end

  end
end

e = Enigma::Encryptor.new
e.encrypt("hello..end..")