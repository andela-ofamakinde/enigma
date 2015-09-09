require_relative "../lib/enigma/encrypt"

module Enigma

  describe "encrypt text"  do

    it "should return the encrypted letter" do

      encrypted_text = Enigma::Encryptor.new

      encrypted = encrypted_text.encrypt_letter("a", 1)

      expect(encrypted).to eq("b")
   end
  
  end
end