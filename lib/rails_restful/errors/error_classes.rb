module RailsRestful::Errors
  class Base < Exception

    # Allowed arguments:
    # :translate
    # => Whether or not the message should be translated.
    # :key
    # => This error's key on config arrays. It is used to get default values.
    #    If not value is provided, the class name is assumed.
    def initialize(msg=nil, **args)
      # If a message was not provided, checks if a default message was configured
      # for this exception type.
      key = args[:key] || self.class.name
      msg ||= if RailsRestful.error_messages.include? key
                RailsRestful.error_messages[key]
              else
                default_message
              end

      # Translates the message if necessary.
      translate = if args.key? :translate
                    args[:translate]
                  else
                    RailsRestful.translate_error_messages
                  end
      if translate
        t_options = args[:t_options] || {}
        begin
          msg = I18n.t! msg, t_options
        rescue I18n::MissingTranslationData
          # Just use original message.
        end
      end

      super msg
    end

    def status
      # For built-in classes the status symbol is derived from the class name.
      Rack::Utils.status_code(self.class.name.demodulize.underscore.to_sym)
    end

    def default_message
      self.class.name.demodulize.underscore.gsub('_', ' ').capitalize
    end
  end

  # 4xx errors
  class BadRequest < Base; end
  class Unauthorized < Base; end
  class PaymentRequired < Base; end
  class Forbidden < Base; end
  class NotFound < Base; end
  class MethodNotAllowed < Base; end
  class NotAcceptable < Base; end
  class ProxyAuthenticationRequired < Base; end
  class RequestTimeout < Base; end
  class Conflict < Base; end
  class Gone < Base; end
  class LengthRequired < Base; end
  class PreconditionFailed < Base; end
  class UnsupportedMediaType < Base; end
  class ExpectationFailed < Base; end
  class UnprocessableEntity < Base; end
  class Locked < Base; end
  class FailedDependency < Base; end
  class UpgradeRequired < Base; end

  # 5xx errors
  class InternalServerError < Base; end
  class NotImplemented < Base; end
  class BadGateway < Base; end
  class ServiceUnavailable < Base; end
  class GatewayTimeout < Base; end
  class HttpVersionNotSupported < Base; end
  class InsufficientStorage < Base; end
  class NotExtended < Base; end
end
