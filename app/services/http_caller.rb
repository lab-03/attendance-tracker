module HttpCaller
  extend HTTParty

  def default_url(url)
    base_uri url
  end

  def default_json_headers
    {'Content-Type' => 'application/json'}
  end
end