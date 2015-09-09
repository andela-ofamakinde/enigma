require_relative "decrypt"
require_relative "cipher"
require_relative "encrypt"
require_relative "decrypt_file"


module Enigma
  class Crack

    def crack_file(secret_file, output_file, date)
      secret_message = File.open(secret_file, "r").read
      arr = secret_message.downcase.split("").each_slice(4).to_a[-1]
      end_array = [".", ".", "e", "n", "d", ".", "."]
      extra_length = secret_message.split("").length - 7

      extra_length.times do 
          end_array.unshift("o")
      end

      encrypt_array = arr.length == 4 ? arr : second_to_last_of_secret_text(secret_message)
      decrypt_array = arr.length == 4 ? last_of_decrypted_text(end_array) : second_to_last_of_decrypted_text(end_array)
      the_date = last_4_of_date_squared(date)
      sort_file_messages(secret_file,output_file, date, encrypt_array, decrypt_array, the_date)
    end

    private

    def last_4_of_date_squared(date)
      (date.to_i**2).to_s.split("").last(4).map(&:to_i)
    end

    def second_to_last_of_secret_text(secret_message)
      secret_message.split("").each_slice(4).to_a[-2]
    end

    def second_to_last_of_decrypted_text(text_array)
      text_array.each_slice(4).to_a[-2]
    end

    def last_of_decrypted_text(text_array)
      text_array.each_slice(4).to_a[-1]
    end

    def sort_file_messages(secret_file, output_file, date, encrypt_array, decrypt_array, the_date)
      encrypt_key = break_key(encrypt_array, decrypt_array, the_date)
      crack_file_messages(secret_file, output_file, encrypt_key, date)
    end

    def crack_file_messages(input_file, output_file, enc_key, enc_date)
      decryptor = File_Decryptor.new
      decryptor.decrypt_file(input_file, output_file, enc_key, enc_date)
    end

    def break_key(encrypted_array, decrypted_array, date_array)
      decryptor = Decryptor.new
      result = []
      j = 0
      while j < 4
          i = 0
      while i < 40
     if decryptor.decrypt_letter(encrypted_array[j], i+date_array[j]) == decrypted_array[j] then 
        if i < 10
          result << "0"+ "#{i}"
        else
          result << i
        end
        break
        end
        i+=1
        end
        j+=1
       
    end
      result
      convert_array(result)
     end

    def convert_array(arr)
      new_array = []
      arr = arr.map { |ar| ar.to_s }
      new_array << arr.shift
      arr.each do |a|
        if a[0] == new_array[-1][1]
            new_array << a.to_s
        elsif (a.to_i+39).to_s[0] == new_array[-1][1]
            new_array << (a.to_i+39).to_s
        elsif (a.to_i+78).to_s[0] == new_array[-1][1]
            new_array << (a.to_i+78).to_s
        else 
            arr = arr.unshift(new_array[0].to_i+39)
            return convert_array(arr)
        end
      end
      new_array[0]+new_array[1][1]+new_array[2][1]+new_array[3][1]
    end

  end
end

input_file = ARGV[0] || input_file
output_file = ARGV[1] || output_file
enc_date = ARGV[2] || enc_date
c = Enigma::Crack.new
c.crack_file(input_file, output_file, enc_date) if input_file


