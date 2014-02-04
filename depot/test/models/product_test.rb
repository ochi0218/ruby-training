require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  # test
  test "product_attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  # test
  test "product price must be positive" do
    product = Product.new(title: 'Book Title', description: 'My Book Description.', image_url: 'book.jpg')

    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  # test
  test "image_url" do
    ok = %w{ fred.gif fred.jpg fread.png }
    bad = %w{ fred.doc fred.xls fread.gif.more }

    ok.each do |name|
      assert new_product(name).valid?
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} sholdn't be valid."
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title, description: "yyy", price: 1, image_url: "fred.gif")

    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join(';')
  end

  def new_product(image_url)
    Product.new(title: 'Book Title', description: 'My Book Description.', price: 1, image_url: image_url)
  end

end
