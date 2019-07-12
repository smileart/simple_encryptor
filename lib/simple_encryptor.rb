# frozen_string_literal: true

require 'openssl'
require 'base64'

# Simple class to crypt / decrypt strings (url-safe version)
#
# https://media.giphy.com/media/3oEjHNCWpx4iQYytAA/giphy.gif
#
# @see https://gist.github.com/colindean/1304057
# @see http://devdocs.io/ruby~2.4/openssl/cipher
#
# @example
#   @secret_key  = 'foobarfoobarfoobarfoobarfoobarfo'
#   @iv          = 'foobarfoobarfoob'
#   secret       = SimpleEncryptor.encrypt('Bond, James Bond', @secret_key, @iv)
#   message      = SimpleEncryptor.decrypt(secret, @secret_key, @iv)
#
class SimpleEncryptor
  # Current lib version
  VERSION = '0.0.3'

  # Encryption type to use (set as a constant since changing it without changing
  # code is unlikely)
  ENCRYPTION_TYPE = 'aes-256-cbc'

  # Static method to encrypt a message
  #
  # @param [String] secret the massage to encrypt
  # @param [String] key secret key to encrypt message with (32 bytes)
  #
  # @return [String] encrypted message (url-safe, Base64)
  def self.encrypt(secret, key, _ = "\0")
    cipher = OpenSSL::Cipher.new(ENCRYPTION_TYPE).encrypt

    cipher.key = key
    iv = cipher.random_iv # initialisation vector

    encrypted = cipher.update(secret) + cipher.final
    encrypted = iv + encrypted

    Base64.urlsafe_encode64(encrypted, padding: false)
  end

  # Static method to decrypt a message
  #
  # @param [String] encrypted_secret the encrypted massage to decrypt (url-safe, Base64)
  # @param [String] key secret key to decrypt message with (32 bytes)
  #
  # @return [String] decrypted message
  def self.decrypt(encrypted_secret, key)
    encrypted_secret = Base64.urlsafe_decode64(encrypted_secret)

    cipher = OpenSSL::Cipher.new(ENCRYPTION_TYPE).decrypt

    cipher.key = key
    cipher.iv  = encrypted_secret.slice!(0, cipher.iv_len) # initialisation vector

    cipher.update(encrypted_secret) + cipher.final
  end
end
