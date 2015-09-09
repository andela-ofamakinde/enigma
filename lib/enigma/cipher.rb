module Enigma
  class Cipher   
    # def cipher(rotation)
    #   characters = ('a'..'z').to_a.concat(("0".."9").to_a).push(" ", ".", ",")
    #   rotated_characters = characters.rotate(rotation)
    #   Hash[characters.zip(rotated_characters)]
    # end
       def cipher(rotation)
       characters = ('a'..'z').to_a.concat(("0".."9").to_a).push(" ", ".", ",")
       rotated_characters = characters.rotate(rotation)
        Hash[characters.zip(rotated_characters)]
     end
  end
end