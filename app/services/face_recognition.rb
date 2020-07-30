module FaceRecognition
  include HTTParty
  base_uri 'https://fr-api.herokuapp.com'

  def self.detect_no_of_faces_in_image(img_url)
    params = {face_image: img_url}.to_json
    resp = post('/detect_faces', headers: {'Content-Type' => 'application/json'}, body: params)
    JSON.parse(resp.body)["number_of_faces"]
  rescue
    return -1
  end

end