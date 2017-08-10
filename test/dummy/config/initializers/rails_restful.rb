RailsRestful.configure do |config|

config.errors = {
  my_custom_error: 'MyCustomError',
}

config.error_messages = {
  my_custom_error: 'This is a custom message.',
  http_version_not_supported: 'Ops',
}

end
