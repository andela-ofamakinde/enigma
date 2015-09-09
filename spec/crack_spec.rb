require_relative "../lib/enigma/crack"

module Enigma

  describe "Crack"  do
    it "should encrypt a file and crack without key" do
      crack = Enigma::Crack.new
      encrypted_text = crack.crack_file("verify.txt", "cracked", "090915")
      secret_message = File.open("cracked.txt", "r").read
      expect(secret_message).to eq("hello everyone how are you doing  ..end..")
    end
  end
end