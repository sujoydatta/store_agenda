class CalculatePriceService
  attr_reader :total_price

  def initialize(items = [])
    @total_price = 0.0
    @items_count = calculate_individual_item_count(items) #calculate individual item number
    @saved_items = Store.all.pluck(:code, :price).to_h
  end

  def calculate_total_price
    @items_count.each do |item, count|
      raise StandardError, "#{item} not found" unless @saved_items[item] # raise exception if queried item not found in system

      @total_price += (@saved_items[item] * count)
    end
  end

  private

  def calculate_individual_item_count(items)
    individual_item_hash = {}
    items.each do |item|
      individual_item_hash[item] ||= 0
      individual_item_hash[item] += 1
    end
    individual_item_hash
  end
end
