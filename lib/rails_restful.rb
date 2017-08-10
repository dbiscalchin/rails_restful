module RailsRestful
  require 'rails_restful/errors/error_classes'
  require 'rails_restful/errors/concern'

  mattr_reader :errors
  mattr_accessor :error_view,
                 :error_messages,
                 :translate_error_messages

  def self.errors=(value)
    @@errors = if @@errors.nil? then value else @@errors.merge(value) end
  end

  def self.register_error_class(klass, key = nil)
    key ||= klass
    self.errors = { key => klass }
  end

  self.error_view = 'errors/api_error'
  self.error_messages = {}
  self.translate_error_messages = true

  # Initializes self.errors
  builtin_errors = RailsRestful::Errors.constants.select { |c|
    const = RailsRestful::Errors.const_get(c)
    const.is_a?(Class) && const < RailsRestful::Errors::Base
  }
  builtin_errors.each { |c|
    klass = RailsRestful::Errors.const_get(c)
    key = klass.name.demodulize.underscore.to_sym
    self.register_error_class(klass, key)
  }

  def self.configure
    yield self
  end
end
