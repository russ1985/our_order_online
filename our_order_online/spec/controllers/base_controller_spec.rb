require "spec_helper"
require "erp_dev_svcs"

describe OurOrderOnline::BaseController do
  describe " GET /create_new_order" do
    it "should create a new order with a new token" do
      get :create_new_order, :route => '/our_order_online/ws'

      parsed_body = JSON.parse(response.body)
      parsed_body["order"]["token"].should_not be_nil?
    end
  end
end