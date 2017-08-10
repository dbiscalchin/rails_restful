class ErrorsController < ApplicationController
  include RailsRestful::Errors::Handling

  def raise_error_action
    fail params[:error].to_sym
  end
end
