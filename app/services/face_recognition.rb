module FaceRecognition
  include HTTParty
  base_uri 'https://fr-api.herokuapp.com'
  DEFAULT_HEADERS = {'Content-Type' => 'application/json'}
  logger Rails.logger, :info, :apache


  def self.detect_no_of_faces_in_image(img_url)
    params = {face_image: img_url}.to_json
    resp = post('/detect_faces', headers: DEFAULT_HEADERS, body: params)
    JSON.parse(resp.body)["number_of_faces"]
  rescue
    return -1
  end

  def self.same_person(original_face, captured_face)
    params = {original_face: original_face, captured_face: captured_face}.to_json
    resp = post('/verify', headers: DEFAULT_HEADERS, body: params)
    JSON.parse(resp.body)["same_person"]
  end


end