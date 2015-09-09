  class Encryptor   
     def cipher(rotation)
       characters = ('a'..'z').to_a.concat(("0".."9").to_a).push(" ", ".", ",")
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
  end
  puts "hii"
  @crackkey = Encryptor.new
#   enemy_message = @crackkey.encrypt("helo there ..end..")
#   puts "This is enemy messgae-" +"#{enemy_message}"+"-"

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

def break_key(encrypted_array, decrypted_array, date_array)
    @result = []
    j = 0
    k = 0
    l = 0
    while j < 4
        i = 0
    while i < 100
 if @crackkey.decrypt_letter(encrypted_array[j], i+date_array[k]) == decrypted_array[l] then 
            if i < 10
                @result << "0"+ "#{i}"
            else
            @result << i
            end
            puts "#{@result}"
        break
        end
    i+=1
    end
    k+=1
    l+=1
    j+=1
   
end
  @result
  konvert(@result)
 end

def konvert(arr)
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
            return konvert(arr)
        end
    end
    p new_array
    new_array[0]+new_array[1][1]+new_array[2][1]+new_array[3][1]
end

sort_messages("qje0gyaq0j3khjgphd", "070915")
# @crackkey.decrypt_letter("o",94)


