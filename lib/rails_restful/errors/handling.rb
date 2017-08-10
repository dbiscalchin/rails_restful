module RailsRestful::Errors::Handling
  extend ActiveSupport::Concern

  included do
    # Handling of Rails Restful errors.
    rescue_from RailsRestful::Errors::Base, with: :render_error
  end

  # Keeps a reference to the Kernel module's implementation.
  alias _kernel_raise raise

  protected

    # Throws an API error. Falls back to the Ruby's raise() implementation if no
    # matching error is found.
    #
    # This method can be called in 3 different ways:
    # 1) Passing an error symbol. E.g.: fail :not_found
    # 2) Passing an error class. E.g.: fail NotFound
    # 3) Passing an exception object. E.g.: fail NotFound.new
    #
    # All form accept a message as the second parameter. Remaing parameters
    # will be passed to the exception's constructor. Example:
    # fail :not_found, I18n.t('errors.not_found'), translate: false
    def raise(*args)
      # Tries to get expected arguments.
      key, message, *init_args = *args

      # If a key was provided, checks if it matches an API error class.
      error_class = error_obj = nil
      if key
        if RailsRestful.errors[key]
          error_class = RailsRestful.errors[key]
        elsif key.is_a?(Class) && key < RailsRestful::Errors::Base
          error_class = key
        elsif key.is_a? RailsRestful::Errors::Base
          error_obj = key
        end
      end

      # Instantiates an error object if a class was found.
      if error_class && !error_obj
        error_class = error_class.constantize if error_class.is_a? String

        # If no message was provided, the named arguments may have been
        # assigned to message.
        if message && !message.is_a?(String)
          init_args = message
          message = nil
        end

        # The constructor expects a hash (not an array).
        init_args = init_args.pop if init_args.respond_to? :pop
        init_args = {} unless init_args.is_a? Hash
        init_args[:key] = key
        error_obj = error_class.new(message, init_args)
      end

      # Raises the execption if it is an API error.
      _kernel_raise error_obj if error_obj

      # Fallback to Ruby's fail() function.
      _kernel_raise *args
    end
    alias fail raise

    # Renders an API error and sets the proper HTTP status on the response.
    def render_error(exception)
      # Stores the exception on an attribute to be accessible from a view.
      @error = exception
      render RailsRestful.error_view, status: exception.status
    end
end
