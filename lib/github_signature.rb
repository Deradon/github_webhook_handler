# TODO: specs
class GithubSignature
  def initialize(payload:, secret_token:, signature:)
    @payload = payload.to_json
    @secret_token = secret_token
    @signature = signature.to_s
  end

  def self.valid?(*args)
    new(*args).valid?
  end

  def valid?
    Rack::Utils.secure_compare(expected_signature, signature)
  end

  private

  attr_reader :payload, :secret_token, :signature

  def expected_signature
    "sha1=#{hexdigest}"
  end

  def hexdigest
    OpenSSL::HMAC.hexdigest(sha1, secret_token, payload)
  end

  def sha1
    OpenSSL::Digest.new('sha1')
  end
end
