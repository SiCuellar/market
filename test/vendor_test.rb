require 'minitest/emoji'
require 'minitest/autorun'
require './lib/vendor'

class VendorTest < Minitest::Test
  def test_it_exist
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
    assert_equal ({}), vendor.invantory
  end

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_it_can_add_stock
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)

    vendor.stock("Tomatoes", 12)

    assert_equal 12, vendor.check_stock("Tomatoes")
    assert_equal 55, vendor.check_stock("Peaches")
  end

  def test_it_can_check_invantory
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)

    vendor.stock("Tomatoes", 12)

    assert_equal 12, vendor.check_stock("Tomatoes")
    assert_equal 55, vendor.check_stock("Peaches")

    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, vendor.inventory
  end
end
