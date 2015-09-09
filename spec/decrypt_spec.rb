require_relative "../lib/enigma/decrypt"

module Enigma

  describe "decrypt text"  do

    it "should return the decrypted letter" do
      decrypted = Enigma::Decryptor.new
      decrypted_letter = decrypted.decrypt_letter("b", 1)
      expect(decrypted_letter).to eq("a")
   end
  
  end
end