# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/simple_encryptor'

RSpec.describe SimpleEncryptor do
  let(:secret_key) { 'foobarfoobarfoobarfoobarfoobarfo' }
  let(:iv) { 'foobarfoobarfoob' }

  let(:secret) { 'Bond, James Bond' }
  let(:short_secret) { 'test' }

  context 'Static' do
    it 'symmetrically encrypts/decrypts message' do
      expect((encrypted_secret = SimpleEncryptor.encrypt(secret, secret_key)).length).to eq(64)
      expect(SimpleEncryptor.decrypt(encrypted_secret, secret_key)).to eq(secret)
    end

    it 'doesn\'t use padding in the resulting base64' do
      expect(SimpleEncryptor.encrypt(short_secret, secret_key)).not_to end_with('=')
    end

    it 'throws an ArgumentError exception on empty secret' do
      expect { SimpleEncryptor.encrypt('', secret_key) }.to raise_error(ArgumentError, 'data must not be empty')
    end

    it 'is compartible with v.0.0.1' do
      encrypted_secret = SimpleEncryptor.encrypt(secret, secret_key, iv)
      expect(encrypted_secret.length).to eq(64)
    end
  end
end
