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

      discount = calculate_discount(item, count)
      @total_price += (@saved_items[item] * count) - discount
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

  def calculate_discount(item, count)
    discount = 0.0
    if item == "MUG" && count >= 2
      discount = (count / 2) * @saved_items[item] # buy 2 get 1 free
    elsif item == "TSHIRT" && count >=3
      discount = (count * @saved_items[item] * 30) / 100.0 # 30% reduction
    end
    discount
  end
end
