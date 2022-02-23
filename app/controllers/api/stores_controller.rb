module Api
  class StoresController < BaseController
    before_action :find_product, only: :update

    def index
      render json: Store.all
    end

    def update
      if @product.update(price_attribute)
        render json: @product
      else
        render_error(400, @product.errors.full_messages.join("\n"))
      end
    end

    def check_price

    end

    private

    def find_product
      @product = Store.find_by id: params[:id]

      return render_error(404, "Product not found") unless @product
    end

    def price_attribute
      params.require(:product).permit(:price)
    end
  end
end
