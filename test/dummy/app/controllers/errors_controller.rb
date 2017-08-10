class ErrorsController < ApplicationController
  include RailsRestful::Errors::Concern

  def raise_error_action
    fail params[:error].to_sym
  end
end
