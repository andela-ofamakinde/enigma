require_relative "../lib/enigma/crack"

module Enigma

  describe "Crack"  do
    it "should encrypt a file and crack without key" do
      crack = Enigma::Crack.new
      encrypted_text = crack.sort_messages(".6a1f00ue50o", "090915")
      expect(encrypted_text).to eq("62650")
    end
  
  end
end