require 'pry'

class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendor_item = @vendors.find_all do |vendor|
      vendor.invantory.include?(item)
    end
    vendor_item
  end

  def sorted_item_list
     items_value_pair = @vendors.map do |vendor|
      vendor.invantory
    end

     items = items_value_pair.map do |params|
      params.keys
    end.flatten

    items.uniq.sort
  end

  def total_inventory
    items_value_pair = @vendors.map do |vendor|
     vendor.invantory
   end
   # items_value_pair.inject(&:merge)
   #maybe?
   total_items_quant_pair = items_value_pair.inject({}) do |sum, params|
     sum.merge(params) { |_, a, b| a + b }
   end
  end

  def sell(item, quantity)

  end


end
