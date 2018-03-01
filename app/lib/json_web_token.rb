class JsonWebToken
  class << self
    ALGORITHM = 'HS256'

    def encode(payload)
      payload[:issued_at] = Time.now.to_i

      JWT.encode(payload, Rails.application.secrets.secret_key_base, ALGORITHM)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base, { algorithm: ALGORITHM })[0]

      HashWithIndifferentAccess.new(body)
    rescue
      nil
    end
  end
end
