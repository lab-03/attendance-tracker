class CommandBase

  def self.call(*params)
    self.new.call(*params)
  end

  def success(result = '', code = nil)
    OpenStruct.new(success?: true, data: result, error: nil, code: code)
  end

  def failure(error, code = nil)
    OpenStruct.new(success?: false, data: nil, error: error, code: code)
  end

end