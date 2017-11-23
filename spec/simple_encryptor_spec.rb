# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/simple_encryptor'

RSpec.describe SimpleEncryptor do
  let(:secret_key) { 'foobarfoobarfoobarfoobarfoobarfo' }
  let(:iv) { 'foobarfoobarfoob' }

  let(:encrypted_secret) { 'Zm9vYmFyZm9vYmFyZm9vYhwQbII-Col3sO7re1_ypzvtSRkDot6MH5oNr0Q5ql6S' }
  let(:secret) { 'Bond, James Bond' }
  let(:short_secret) { 'test' }

  context 'Static' do
    it 'symmetrically encrypts message' do
      expect(SimpleEncryptor.encrypt(secret, secret_key, iv)).to eq(encrypted_secret)
    end

    it 'symmetrically decrypts message' do
      expect(SimpleEncryptor.decrypt(encrypted_secret, secret_key)).to eq(secret)
    end

    it 'doesn\'t use padding in the resulting base64' do
      expect(SimpleEncryptor.encrypt(short_secret, secret_key, iv)).not_to end_with('=')
    end

    it 'throws an ArgumentError exception on empty secret' do
      expect { SimpleEncryptor.encrypt('', secret_key, iv) }.to raise_error(ArgumentError, 'data must not be empty')
    end
  end
end
