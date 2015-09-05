require_relative 'encrypt'
  
module Enigma
  class File_Encryptor 

    def encrypt_file(input_file, output_file)
      message = File.open(input_file, "r")
      encrypt_text = Encryptor.new
      puts encrypt_secret = encrypt_text.encrypt(message.read)
      encrypted_message = File.open(output_file, "w")
      encrypted_message.write(encrypt_secret)
      encrypted_message.close
    end

  end
end