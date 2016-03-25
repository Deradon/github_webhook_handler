# TODO: specs
class GithubSignature
  HMAC_DIGEST = OpenSSL::Digest::Digest.new('sha1')

  class << self
    def from_request(request, secret:)
      new(
        payload_body: payload_from_request(request),
        secret: secret,
        signature: request.headers["HTTP_X_HUB_SIGNATURE"]
      )
    end

    private

    def payload_from_request(request)
      request.body.rewind
      request.body.read
    end
  end

  def initialize(payload_body:, secret:, signature:)
    @payload_body = payload_body
    @secret = secret
    @signature = signature.to_s
  end

  def valid?
    Rack::Utils.secure_compare(expected_signature, signature)
  end

  private

  attr_reader :payload_body, :secret, :signature

  def expected_signature
    "sha1=#{hexdigest}"
  end

  def hexdigest
    OpenSSL::HMAC.hexdigest(HMAC_DIGEST, secret, payload_body)
  end
end
