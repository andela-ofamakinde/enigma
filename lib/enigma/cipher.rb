module Enigma
  class Cipher   
    def cipher(rotation)
      characters = (' '..'z').to_a
      rotated_characters = characters.rotate(rotation)
      Hash[characters.zip(rotated_characters)]
    end
  end
end