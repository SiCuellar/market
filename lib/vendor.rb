require 'pry'

class Vendor
  attr_reader :name,
              :invantory

  def initialize(name)
    @name = name
    @invantory = Hash.new(0)
  end

  def check_stock(item)
    @invantory[item]
  end

  def stock(item, quantity)
    @invantory[item] += quantity
  end

  def inventory
    @invantory
  end
end
