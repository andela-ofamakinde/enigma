module Enigma
  class Rotation 
    def construct_rotation_hash(rotation, date, text)
     @rotation = rotation.split("")
     @new_date = (date.to_i**2).to_s.split("").last(4)
     @cypher_array = []
     i = 0
     while i < 4
       @cypher_array << ("#{@rotation[i]}" + "#{@rotation[i+1]}").to_i + (@new_date[i]).to_i
       i+=1
     end
     @cypher_array 
     rotation_hash = Hash[@cypher_array.zip(text)]
     rotation_hash
   end
  end
end