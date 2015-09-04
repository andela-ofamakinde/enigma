require_relative "enigma/version"

module Enigma

    def cipher(rotation)
      characters = (' '..'z').to_a
      rotated_characters = characters.rotate(rotation)
      Hash[characters.zip(rotated_characters)]
    end
      
    def break_key(rotation, dated, string)
      @rotation = rotation.split("")
      @dated_square = (dated.to_i * dated.to_i).to_s.split("")
      @new_date = @dated_square.drop(@dated_square.length - 4)
      @arotation = ("#{@rotation[0]}" + "#{@rotation[1]}").to_i + (@new_date[0]).to_i
  
      @brotation = ("#{@rotation[1]}" + "#{@rotation[2]}").to_i + (@new_date[1]).to_i
  
      @crotation = ("#{@rotation[2]}" + "#{@rotation[3]}").to_i + (@new_date[2]).to_i
  
      @drotation = ("#{@rotation[3]}" + "#{@rotation[4]}").to_i + (@new_date[3]).to_i
      @cypher_array = [@arotation, @brotation, @crotation, @drotation]
      @letters = string.split("")
      puts @rotation_array = Hash[@letters.zip(@cypher_array)]
    end
      
  class Encryptor   
    def encrypt_letter(letter, rotated)
      cipher_for_rotation = cipher(rotated)    
      cipher_for_rotation[letter]
    end

    def encrypt(string)
      rotation = rand.to_s[2..6]
      puts "this is " + "#{rotation}"
      dated = Time.now.strftime("%d%m%y")
      break_key(rotation, dated, string)
      results = @rotation_array.collect do |letter, rotation|
        encrypted_letter = encrypt_letter(letter, rotation)
      end

      results.join
    end
  end

  class Decryptor
    def decrypt_letter(letter, rotated)
      cipher_for_rotation = cipher(rotated)    
      cipher_for_rotation.key(letter)
    end
      
      def decrypt(string, enc_key, enc_date)
        break_key(enc_key, enc_date, string)
        results = @rotation_array.collect do |letter, rotation|
          encrypted_letter = decrypt_letter(letter, rotation)
        end

        results.join
      end
      
    end

  end
