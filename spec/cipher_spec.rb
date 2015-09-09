require_relative "../lib/enigma/cipher"

module Enigma

  describe "Cipher"  do
    it "should create a cipher hash" do

      new_cipher = Enigma::Cipher.new

      cipher = new_cipher.cipher(1)

      characters = ('a'..'z').to_a.concat(("0".."9").to_a).push(" ", ".", ",")
      character_hash = Hash[characters.zip(characters.rotate(1))]
      expect(cipher).to eq(character_hash)
    end
  
  end
end