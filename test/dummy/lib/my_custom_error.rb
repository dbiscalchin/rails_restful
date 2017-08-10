class MyCustomError < RailsRestful::Errors::Base
  def status
    500
  end
end
