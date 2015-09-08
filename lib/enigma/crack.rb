require_relative 'encrypt'
require_relative 'decrypt'
require_relative 'cipher'

module Enigma
  class Crack
    #   def sort_messages(encrypted_message, date)
    #   encrypt = encrypted_message.split(//).last(7).join
    #   p encrypt
    #   end_array = "..end.."
    #   # new_date = (date.to_i**2).to_s.split("").last(4).map(&:to_i)
    #   p date
    #   break_key(encrypt, end_array, date)
    # end
    def sort_messages(encrypted_message, date)
        encrypt_array = encrypted_message.split("").each_slice(4).to_a[-2]
        end_array = [".", ".", "e", "n", "d", ".", "."]
        extra_length = encrypted_message.split("").length - 7
        extra_length.times do 
            end_array.unshift("o")
        end
        # puts "#{end_array
        puts "#{encrypt_array}"

        decrypt_array = end_array.each_slice(4).to_a[-2]
        
          puts "#{decrypt_array}"
        the_date = (date.to_i**2).to_s.split("").last(4).map(&:to_i)
        break_key(encrypt_array, decrypt_array, the_date)
    end
    # def break_key(encrypted_array, decrypted_array, date)
    #   # dated = date.join.to_s
    #   # p dated
    #   p encrypted_array
    #   @new_decrypt = Decryptor.new
    #   # answer = @new_decrypt.decrypt("vfx00fr", "06053", "080915")
    #   # p answer
    #   result = []
    #    (10000..99999).each do |i|
    #     answer2 = @new_decrypt.decrypt(encrypted_array, i.to_s, date)
    #     # require "pry-nav"; binding.pry if i == 93351
    #     if answer2 === decrypted_array then
    #       result << i
    #       require "pry-nav"; binding.pry
    #       break
    #     end
    #    end
    #     result
    # end


    def break_key(encrypted_array, decrypted_array, date_array)
      # require "pry-nav"; binding.pry
      result = []
      j = 0
      k = 0
      l = 0
      cipher_new = Cipher.new
      # rotation = i+date_array[k]
      # cipher_for_rotation = cipher_new.cipher(rotation)
      new_decrypt = Decryptor.new
      while j < 4
        i = 0
          while i < 40
            rotation = i+date_array[k]
            cipher_for_rotation = cipher_new.cipher(rotation)
            # new_cipher = cipher(rotation)
            decrypted = new_decrypt.decrypt_letter(encrypted_array[j], cipher_for_rotation)
            if decrypted == decrypted_array[l] then 
              if i < 10
                result << "0"+ "#{i}"
              else
                result << i
              end
              p result
              break
            end
              i+=1
          end
        k+=1
        l+=1
        j+=1
      end
      result
      # convert_key(result)
    end

    def convert_key(arr)
      arr = arr.map { |ar| ar.to_s }
      new_array = []
      new_array << arr.shift
      # require "pry-nav"; binding.pry
      arr.each do |a|
        if a[0] == new_array[-1][1]
          new_array << a.to_s
        elsif (a.to_i+39).to_s[0] == new_array[-1][1]
          new_array << (a.to_i+39).to_s
        elsif (a.to_i+78).to_s[0] == new_array[-1][1]
          new_array << (a.to_i+78).to_s
        else 
          arr = arr.unshift(new_array[0].to_i+39)
        
           convert_key(arr)
        end
      end
      new_array[0]+new_array[1][1]+new_array[2][1]+new_array[3][1]
    end

  end
end