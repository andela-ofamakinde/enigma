require_relative "enigma/version"

module Enigma
   
  class Encryptor   
    def cipher(rotation)
      characters = (' '..'z').to_a
      rotated_characters = characters.rotate(rotation)
      Hash[characters.zip(rotated_characters)]
    end

    def break_key(rotation, dated, string)
      @rotation = rotation.split("")

      @letters = string.split("")
      
      @dated_square = (dated.to_i * dated.to_i).to_s.split("")

      @new_date = @dated_square.drop(@dated_square.length - 4)

      @arotation = ("#{@rotation[0]}" + "#{@rotation[1]}").to_i + (@new_date[0]).to_i
  
      @brotation = ("#{@rotation[1]}" + "#{@rotation[2]}").to_i + (@new_date[1]).to_i
  
      @crotation = ("#{@rotation[2]}" + "#{@rotation[3]}").to_i + (@new_date[2]).to_i
  
      @drotation = ("#{@rotation[3]}" + "#{@rotation[4]}").to_i + (@new_date[3]).to_i

      @cypher_array = [@arotation, @brotation, @crotation, @drotation]

      @rotation_array = Hash[@letters.zip(@cypher_array)]
    end

    def encrypt_letter(letter, rotated)
      cipher_for_rotation = cipher(rotated)    
      cipher_for_rotation[letter]
    end

    def encrypt(string)
      rotation = rand.to_s[2..6]
      puts "this is " + "#{rotation}"
      dated = Time.now.strftime("%d%m%y")
      break_key(rotation, dated, string.to_s)
      results = @rotation_array.collect do |letter, rotation|
        encrypted_letter = encrypt_letter(letter, rotation)
      end

      results.join
    end

    def encrypt_file(input_file, output_file)
      message = File.open(input_file, "r")
      puts encrypt_secret = encrypt(message.read)
      encrypted_message = File.open(output_file, "w")
      encrypted_message.write(encrypt_secret)
      encrypted_message.close
    end

  end

  class Decryptor
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

    def decrypt_file(input_file, output_file, enc_key, enc_date)
      demessage = File.open(input_file, "r")
      decrypt_secret = decrypt(demessage.read, enc_key, enc_date)
      decrypted_message = File.open(output_file, "w")
      decrypted_message.write(decrypt_secret)
      decrypted_message.close
    end
      
  end

end
