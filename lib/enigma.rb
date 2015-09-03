require_relative "enigma/version"

module Enigma
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  class Encryptor
    def encrypt_letter(letter, rotation)
      cipher_for_rotation = cipher(rotation)    
      cipher_for_rotation[letter]
    end

    def encrypt(string, rotation)
      letters = string.split("")

      results = letters.collect do |letter|
        encrypted_letter = encrypt_letter(letter, rotation)
      end

      results.join
    end
  end

  class Decryptor
    def decrypt_letter(letter, rotation)
      cipher_for_rotation = cipher(rotation)    
      cipher_for_rotation.key(letter)
    end

    def decrypt(string, rotation)
      letters = string.split("")

      results = letters.collect do |letter|
        decrypted_letter = decrypt_letter(letter, rotation)
      end

      results.join
    end

  end

  class Keyencryptor

  def cipher(rotation_key)
    ratation_key = rand.to_s[2..5]
    key_array = rotation_key.split(" ")

    key_array = rotation_key.to_s.chars.map(&:to_i)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

    def encrypt_letter(letter, rotation)
      cipher_for_rotation = cipher(rotation)    
      cipher_for_rotation[letter]
    end

    def encrypt(string, rotation)
      letters = string.split("")

      results = letters.collect do |letter|
        encrypted_letter = encrypt_letter(letter, rotation)
      end

      results.join
    end
  end
  
end
