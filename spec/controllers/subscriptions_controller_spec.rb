require File.dirname(__FILE__) + '/../spec_helper'

describe SubscriptionsController do
  setup do
    @mailing_list = MailingList.find_or_create_by_name("TestMailingList")
    @user = Factory(:user)
  end

  it "should create subscription for user" do
    lambda{
      post({:user_id => @user.id, :mailing_list_id => @mailing_list.id})
    }.should change(Subscription, :count)
  end
 
end
