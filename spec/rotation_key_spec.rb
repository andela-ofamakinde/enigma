require_relative "../lib/enigma/rotation_key"

module Enigma

  describe "Rotation Key"  do
    it "should create a hash" do

      rotated_key = Enigma::Rotation.new

      encrypted_hash = rotated_key.break_key("50267", "090915", ["j", ".", ".", "e"])

      expect(encrypted_hash).to eq({57=>"j", 4=>".", 28=>".", 72=>"e"})
    end
  
  end
end