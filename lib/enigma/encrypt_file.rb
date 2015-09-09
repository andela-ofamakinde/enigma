require_relative 'encrypt'
  
module Enigma
  class File_Encryptor 

    def encrypt_file(input_file, output_file)
      message = File.open(input_file, "r")
      encrypt_text = Encryptor.new
      puts encrypt_secret = encrypt_text.encrypt(message.read)
      encrypted_message = File.open(output_file, "w")
      encrypted_message.write(encrypt_secret[:text])
      encrypted_message.close
      
      p "Created #{output_file} with the key #{encrypt_secret[:key]} and date #{encrypt_secret[:date]}"
    end

  end
end

input_file = ARGV[0] || input_file
output_file = ARGV[1] || output_file
b = Enigma::File_Encryptor.new
b.encrypt_file(input_file, output_file) if input_file