class BaseService
  def self.call(...)
    new(...).call
  end

  def self.call!(...)
    new(...).call!
  end

  class Error < StandardError; end
end
