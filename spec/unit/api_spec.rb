require 'spec_helper'

describe "Bigcommerce" do
  describe "API" do
    include_context "mock api"

    context "requests" do
      it "get a time resource" do
        api.connection.should_receive(:get).once.with("/time")
        api.get_time
      end

      it "get a brands resource" do
        api.connection.should_receive(:get).once.with("/brands", {})
        api.get_brands
      end

      it "get a brands resource with provided options" do
        api.connection.should_receive(:get).once.with("/brands", {:me => 'mo'})
        api.get_brands({:me => 'mo'})
      end

      it "create a brands resource" do
        api.connection.should_receive(:post).once.with("/brands", {})
        api.create_brands
      end

      it "update a brands resource" do
        api.connection.should_receive(:put).once.with("/brands/123", {})
        api.update_brand(123)
      end

      it "get coupons resource" do
        api.connection.should_receive(:get).once.with("/coupons", {})
        api.get_coupons
      end

      it "create coupons resource" do
        api.connection.should_receive(:post).once.with("/coupons", {})
        api.create_coupons
      end

      it "get a product resource by id" do
        api.connection.should_receive(:get).once.with("/products/333", {})
        api.get_product(333)
      end

      it "get a compound resource by ids" do
        api.connection.should_receive(:get).once.with("/orders/999/products/333", {})
        api.get_orders_product(999, 333)
      end

      it "get a resource with pagination" do
        api.connection.should_receive(:get).once.with("/orders", {:page => 2})
        api.get_orders(:page => 2)
      end

      it "get a resource with limit" do
        api.connection.should_receive(:get).once.with("/categories", {:limit => 10})
        api.get_categories(:limit => 10)
      end

      it "get a resource with pagination and limit" do
        api.connection.should_receive(:get).once.with("/customers", {:limit => 10, :page => 2})
        api.get_customers(:limit => 10, :page => 2)
      end
    end
  end
end
