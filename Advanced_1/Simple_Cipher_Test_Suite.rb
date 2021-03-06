require 'minitest/autorun'
require_relative 'simple_cipher'

class RandomKeyCipherTest < Minitest::Test
  def setup
    @cipher = Cipher.new
  end

  def test_cipher_key_is_letters
    assert_match(/\A[a-z]+\z/, @cipher.key)
  end

  def test_cipher_encode
    #skip
    plaintext = 'aaaaaaaaaa'
    assert_equal(@cipher.key[0, 10], @cipher.encode(plaintext))
  end

  def test_cipher_decode
    #skip
    plaintext = 'aaaaaaaaaa'
    assert_equal(plaintext, @cipher.decode(@cipher.key[0, 10]))
  end


  def test_cipher_reversible
    #skip
    plaintext = 'abcdefghij'
    assert_equal(plaintext, @cipher.decode(@cipher.encode(plaintext)))
  end
end

class IncorrectKeyCipherTest < MiniTest::Test
  def test_cipher_with_caps_key
    #skip
    assert_raises ArgumentError do
      Cipher.new('ABCDEF')
    end
  end

  def test_cipher_with_numeric_key
    #skip
    assert_raises ArgumentError do
      Cipher.new('12345')
    end
  end

  def test_cipher_with_empty_key
    #skip
    assert_raises ArgumentError do
      Cipher.new('')
    end
  end

  def test_cipher_with_empty_key_with_a_space
    #skip
    assert_raises ArgumentError do
      Cipher.new(' ')
    end
  end
end

class SubstitutionCipherTest < MiniTest::Test
  def setup
    @key = 'abcdefghij'
    @cipher = Cipher.new(@key)
  end

  def test_cipher_key_is_as_submitted
    #skip
    assert_equal(@cipher.key, @key)
  end

  def test_cipher_encode
    #skip
    plaintext = 'aaaaaaaaaa'
    ciphertext = 'abcdefghij'
    assert_equal(ciphertext, @cipher.encode(plaintext))
  end

  def test_cipher_decode
    #skip
    plaintext = 'aaaaaaaaaa'
    ciphertext = 'abcdefghij'
    assert_equal(plaintext, @cipher.decode(ciphertext))
  end

  def test_cipher_reversible
    #skip
    plaintext = 'abcdefghij'
    assert_equal(plaintext, @cipher.decode(@cipher.encode(plaintext)))
  end

  def test_double_shift_encode
    #skip
    plaintext = 'iamapandabear'
    ciphertext = 'qayaeaagaciai'
    assert_equal(ciphertext, Cipher.new('iamapandabear').encode(plaintext))
  end

  def test_cipher_encode_wrap
    #skip
    plaintext = 'zzzzzzzzzz'
    ciphertext = 'zabcdefghi'
    assert_equal(ciphertext, @cipher.encode(plaintext))
  end
end

class PseudoShiftCipherTest < MiniTest::Test
  def setup
    @cipher = Cipher.new('dddddddddd')
  end

  def test_cipher_encode
    #skip
    plaintext = 'aaaaaaaaaa'
    ciphertext = 'dddddddddd'
    assert_equal(ciphertext, @cipher.encode(plaintext))
  end

  def test_cipher_decode
    #skip
    plaintext = 'aaaaaaaaaa'
    ciphertext = 'dddddddddd'
    assert_equal(plaintext, @cipher.decode(ciphertext))
  end

  def test_cipher_reversible
    #skip
    plaintext = 'abcdefghij'
    assert_equal(plaintext, @cipher.decode(@cipher.encode(plaintext)))
  end

  def test_cipher_with_caps__and_lower_case
    #skip
    assert_raises ArgumentError do
      Cipher.new('aBCDEF')
    end
  end
end