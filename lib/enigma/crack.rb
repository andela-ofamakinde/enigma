require_relative 'encrypt'
require_relative 'decrypt'
require_relative 'cipher'

module Enigma
  class Crack
      def sort_messages(encrypted_message, date)
      encrypt = encrypted_message.split(//).last(7).join
      # encrypt = encrypted_message.split("").each_slice(4).to_a[1]
      # encrypt_array = decrypted_message.split("").each_slice(4).to_a[1]

      p encrypt
      end_array = "..end.."

      # new_date = (date.to_i**2).to_s.split("").last(4).map(&:to_i)
      p date
      break_key(encrypt, end_array, date)
    end

    def break_key(encrypted_array, decrypted_array, date)
      # dated = date.join.to_s
      # p dated
      p encrypted_array
      @new_decrypt = Decryptor.new
      # answer = @new_decrypt.decrypt("vfx00fr", "06053", "080915")
      # p answer
      result = []
       (10000..99999).each do |i|
        answer2 = @new_decrypt.decrypt(encrypted_array, i.to_s, date)
        # require "pry-nav"; binding.pry if i == 93351
        if answer2 === decrypted_array then
          result << i
          require "pry-nav"; binding.pry
          break
        end
       end
        result

      # i = 0
      # while i < 99999
      # new_decrypt = Decryptor.new

      #   if  new_decrypt.decrypt(encrypted_array, i.to_s, dated) === decrypted_array then
      #     p encrypted_array
      #     p decrypted_array
      #     p i
      #     p "hello"
      #     # p new_decrypt.decrypt(encrypted, i.to_s, dated)
      #     result << i
      #     p result
      #   end
      #     i+=1
      #     break
      #     next
      #   end
    end


    # def break_key(encrypted_array, decrypted_array, date_array)
    #   result = []
    #   j = 0
    #   k = 0
    #   l = 0
    #   while j < 4
    #     i = 0
    #       while i < 40
    #         # require "pry-nav"; binding.pry
    #         # rotation = i+date_array[k]
    #         # new_cipher = cipher(rotation)
    #         p i
    #         decrypted = decrypt(encrypted_array[j],  i+date_array[k])
    #         if decrypted == decrypted_array[l] then 
    #           if i < 10
    #             result << "0"+ "#{i}"
    #           else
    #             result << i
    #           end
    #           p result
    #           break
    #         end
    #         i+=1
    #       end
    #     k+=1
    #     l+=1
    #     j+=1
    #   end
    #   result
    #   # convert_key(result)
    # end

    # def cipher(rotation)
    #   cipher = Cipher.new
    #   cipher_for_rotation = cipher.cipher(rotation)
    #   cipher_for_rotation
    #   # cipher_for_rotation.key(letter)
    # end

    # def decrypt(letter, rotation)
    #   new_cipher = Cipher.new
    #   cipher_for_rotation = new_cipher.cipher(rotation)
    #   decryptor = Decryptor.new
    #   decryptor.decrypt_letter(letter, cipher_for_rotation)
    # end

    # def decrypt(letter, rotation)
    #   new_cipher = Cipher.new
    #   p rotation
    #   cipher_for_rotation = new_cipher.cipher(rotation)
    #   p cipher_for_rotation
    #   cipher_for_rotation.key(letter)
    # end

    #   def cipher(rotation)
    #    characters = ('a'..'z').to_a.concat(("0".."9").to_a).push(" ", ".", ",")
    #    rotated_characters = characters.rotate(rotation)
    #     Hash[characters.zip(rotated_characters)]
    #  end
    # def decrypt(letter, rotated)
    #    cipher_for_rotation = cipher(rotated)    
    #    cipher_for_rotation.key(letter)
    #  end


#     def convert_key(arr)
#       arr = arr.map { |ar| ar.to_s }
#       new_array = []
#       new_array << arr.shift
#       # require "pry-nav"; binding.pry
#       arr.each do |a|
#         if a[0] == new_array[-1][1]
#           new_array << a.to_s
#         elsif (a.to_i+39).to_s[0] == new_array[-1][1]
#           new_array << (a.to_i+39).to_s
#         elsif (a.to_i+78).to_s[0] == new_array[-1][1]
#           new_array << (a.to_i+78).to_s
#         else 
#           arr = arr.unshift(new_array[0].to_i+39)
        
#           return convert_key(arr)
#         end
#       end
#       p new_array
#       new_array[0]+new_array[1][1]+new_array[2][1]+new_array[3][1]
#     end

  end
end