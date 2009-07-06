# To change this template, choose Tools | Templates
# and open the template in the editor.

class SubscriptionsController < Spree::BaseController
  resource_controller
  actions :all, :only => [:create, :destroy]

  create.response do |wants|
    wants.html do
      flash[:notice] = I18n.t(:subscribed)
      redirect_to :back
    end
  end

  create_fails.response.html do
    flash[:notice] = I18n.t(:incorrect_email)
    redirect_to :back
  end
    
  destroy.response do |wants|
    wants.html do
      flash[:notice] = I18n.t(:unsubscribed)
      redirect_to :back
    end
  end
end
