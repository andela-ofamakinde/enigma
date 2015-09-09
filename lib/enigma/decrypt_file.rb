require_relative 'decrypt'

module Enigma
  class File_Decryptor

    def decrypt_file(input_file, output_file, enc_key, enc_date)
      secret_message = File.open(input_file, "r")
      decryptor = Decryptor.new
      decrypt_secret = decryptor.decrypt(secret_message.read, enc_key, enc_date)
      
      decrypted_message = File.open(output_file, "w")
      decrypted_message.write(decrypt_secret[:text])
      decrypted_message.close
      
      p "Created #{output_file} with the key #{decrypt_secret[:key]} and date #{decrypt_secret[:date]}"
    end
      
  end
end

input_file = ARGV[0] || input_file
output_file = ARGV[1] || output_file
enc_key = ARGV[2] || enc_key
enc_date = ARGV[3] || enc_date
f = Enigma::File_Decryptor.new
f.decrypt_file(input_file, output_file, enc_key, enc_date) if input_file