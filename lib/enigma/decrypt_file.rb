require_relative 'decrypt'

module Enigma
  class File_Decryptor

    def decrypt_file(input_file, output_file, enc_key, enc_date)
      secret_message = File.open(input_file, "r")
      decrypt_text = Decryptor.new
      decrypt_secret = decrypt_text.decrypt(secret_message.read, enc_key, enc_date)
      decrypted_message = File.open(output_file, "w")
      decrypted_message.write(decrypt_secret)
      decrypted_message.close
    end
      
  end
end