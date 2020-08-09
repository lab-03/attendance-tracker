module AttendanceVerifier
  include HTTParty
  base_uri 'https://gp-qrcode.herokuapp.com/api/'.freeze

  def self.create_qr_code(params)
    resp = post('/qrcodes/create',
                headers: {'Content-Type' => 'application/json'},
                body: AttendanceVerifier.qr_code_params(params))
    JSON.parse(resp.body)["data"]
  end

  def self.qr_code_params(params)
    {hash: params[:hash], longitude: params[:long], latitude: params[:lat], applyChecks: params[:applyChecks]}.to_json
  end

end