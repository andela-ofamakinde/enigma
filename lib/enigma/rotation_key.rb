module Enigma
  class Rotation 
    def rotate_key(key, date)
      @rotation = key.split("")
      @new_date = (date.to_i**2).to_s.split("").last(4)
      @cypher_array = []
      i = 0
      while i < 4
        @cypher_array << ("#{@rotation[i]}" + "#{@rotation[i+1]}").to_i + (@new_date[i]).to_i
        i+=1
      end
      @cypher_array
    end
  end
end