require_relative "../lib/enigma/decrypt_file"

module Enigma

  describe "Decrypt file"  do
    it "should Decrypt a file" do
      file_decrypt = Enigma::File_Decryptor.new
      encrypted_text = file_decrypt.decrypt_file("encrypt_test", "sample.txt", "93633", "090915")

      expect(File.exist?("sample.txt")).to be true

      secret_message = File.open("encrypt_test", "r").read

      expect(secret_message).to eq("3k. u40nl9gx ,xaxx cx fat y0 3u")
    end
  end
end