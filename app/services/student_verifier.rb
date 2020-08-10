module StudentVerifier
  include HTTParty
  base_uri "https://gp-verifier.herokuapp.com/api/"
  DEFAULT_HEADERS = {'Content-Type' => 'application/json'}
  logger Rails.logger, :info, :apache


  def self.verify(verification_params)
    resp = post('qrcodes/verify', headers: DEFAULT_HEADERS, body: verification_params.to_json)
    JSON.parse(resp.body)
  end
end