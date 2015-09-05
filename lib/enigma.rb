require_relative "enigma/version"

module Enigma
       
  class Encryptor   

    def cipher(rotation)
      characters = (' '..'z').to_a
      rotated_characters = characters.rotate(rotation)
      Hash[characters.zip(rotated_characters)]
    end

  def break_key(rotation, dated, stringed)
    @rotation = rotation.split("")
    @new_date = (dated.to_i**2).to_s.split("").last(4)
    @cypher_array = []
    i = 0
    while i < 4
      @cypher_array << ("#{@rotation[i]}" + "#{@rotation[i+1]}").to_i + (@new_date[i]).to_i
      i+=1
    end
    @cypher_array 
    @rotation_hash = Hash[@cypher_array.zip(stringed)]
    puts @rotation_hash
  end

    def encrypt_letter(letter, rotated)
      cipher_for_rotation = cipher(rotated)    
      cipher_for_rotation[letter]
    end

    def encrypt(string)
      rotation = rand.to_s[2..6]
      puts "this is " + "#{rotation}"
      dated = Time.now.strftime("%d%m%y")
      
      stringed = (string).split("").each_slice(4).to_a      
      result = stringed.collect do |arr|
        break_key(rotation, dated, arr)
        results = @rotation_hash.collect do |letter, rotation|
            encrypted_letter = encrypt_letter(rotation, letter)
        end
        results.join
      end
      result.join
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
    
    def break_key(rotation, dated, stringed)
      @rotation = rotation.split("")
      @new_date = (dated.to_i**2).to_s.split("").last(4)
      @cypher_array = []
      i = 0
      while i < 4
        @cypher_array << ("#{@rotation[i]}" + "#{@rotation[i+1]}").to_i + (@new_date[i]).to_i
        i+=1
      end
      @cypher_array 
      @rotation_hash = Hash[@cypher_array.zip(stringed)]
      puts @rotation_hash
    end

    def decrypt_letter(letter, rotated)
      cipher_for_rotation = cipher(rotated)    
      cipher_for_rotation.key(letter)
    end
      
  def decrypt(string, enc_key, enc_date)
    stringed = (string).split("").each_slice(4).to_a
      
    result = stringed.collect do |arr|
      break_key(enc_key, enc_date, arr)
      results = @rotation_hash.collect do |letter, rotation|
        encrypted_letter = decrypt_letter(rotation, letter)
      end
      results.join
    end
    result.join
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
