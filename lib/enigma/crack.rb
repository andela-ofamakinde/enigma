require_relative "decrypt"
require_relative "cipher"
require_relative "encrypt"


module Enigma
  class Crack

    def sort_messages(encrypted_message, date)
    arr = encrypted_message.downcase.split("").each_slice(4).to_a[-1]
    end_array = [".", ".", "e", "n", "d", ".", "."]
    extra_length = encrypted_message.split("").length - 7
    extra_length.times do 
        end_array.unshift("o")
    end
    if arr.length == 4
        encrypt_array = arr
        decrypt_array = end_array.each_slice(4).to_a[-1]
    else
        encrypt_array = encrypted_message.split("").each_slice(4).to_a[-2]
        decrypt_array = end_array.each_slice(4).to_a[-2]
    end
    the_date = (date.to_i**2).to_s.split("").last(4).map(&:to_i)
    p break_key(encrypt_array, decrypt_array, the_date)
    end

    def cipher(rotation)
      characters = ('a'..'z').to_a.concat(("0".."9").to_a).push(" ", ".", ",")
      rotated_characters = characters.rotate(rotation)
      Hash[characters.zip(rotated_characters)]
    end

    def decrypt_letter(letter, rotated)
       cipher_for_rotation = cipher(rotated)    
       cipher_for_rotation.key(letter)
    end

    def break_key(encrypted_array, decrypted_array, date_array)
      result = []
      j = 0
      while j < 4
          i = 0
      while i < 40
     if decrypt_letter(encrypted_array[j], i+date_array[j]) == decrypted_array[j] then 
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
      p result
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

c = Enigma::Crack.new
 text = ARGV[0] || text
 offset = ARGV[1] || offset
c.sort_messages(text, offset) if text && offset
