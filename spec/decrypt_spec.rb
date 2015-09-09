require_relative "../lib/enigma/decrypt"

module Enigma

  describe "decrypt text"  do
    it "should return the decrypted text" do

      decrypted_text = Enigma::Decryptor.new

      decrypted = decrypted_text.decrypt("tbx.0", "83499", "090915")

      expect("tbx.0".length).to eq(decrypted.length)

      expect(decrypted).to eq("hello")
    end

    it "should return the decrypted letter" do

      decrypted = Enigma::Decryptor.new

      decrypted_letter = decrypted.decrypt_letter("b", 1)

      expect(decrypted_letter).to eq("a")
   end
  
  end
end