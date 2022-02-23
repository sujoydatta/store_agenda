module Api
  class StoresController < BaseController
    before_action :find_product, only: :update
    before_action :check_items, only: :check_price

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
      calculate_price = CalculatePriceService.new(params[:items])
      calculate_price.calculate_total_price

      render json: { price: calculate_price.total_price }
    rescue StandardError => e
      render_error(400, e)
    end

    private

    def find_product
      @product = Store.find_by id: params[:id]

      return render_error(404, "Product not found") unless @product
    end

    def price_attribute
      params.require(:product).permit(:price)
    end

    def check_items
      return render_error(400, "Items param not found") unless params[:items]

      return render_error(400, "Items param must be an array") unless params[:items].class == Array
    end
  end
end
