module Api
  class BaseController < ActionController::API
    # error response code, take a error code(400, 401 etc) and error message
    def render_error(error_code, message = {})
      render json: {
        error: {
          code: error_code,
          message: message
        }
      }, status: error_code
    end
  end
end
