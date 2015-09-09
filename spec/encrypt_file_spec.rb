require_relative "../lib/enigma/encrypt_file"

module Enigma

  describe "Encrypt file"  do
    it "should encrypt a file with the date and rotation" do
      file_encrypt = Enigma::File_Encryptor.new
      encrypted_text = file_encrypt.encrypt_file("test_encryypt.txt", "encrypt_test.txt", )
      message = File.open("test_encryypt.txt", "r").read

      expect(message).to eq("Hello everyone how are you doing  ..end..")

      expect(File.exist?("encrypt_test.txt")).to be true
    end
  end
end