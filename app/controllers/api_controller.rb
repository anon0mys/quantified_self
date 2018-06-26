class ApiController < ActionController::API
  include ActionController::Helpers
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render status: 404, json: {}
  end
end
