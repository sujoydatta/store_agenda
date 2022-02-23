module Api
  class StoresController < BaseController
    def index
      render json: Store.all
    end

    def update

    end

    def check_price

    end
  end
end
