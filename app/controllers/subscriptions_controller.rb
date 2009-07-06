# To change this template, choose Tools | Templates
# and open the template in the editor.

class SubscriptionsController < Spree::BaseController
  resource_controller
  actions :all, :only => [:create, :update, :destroy]
end
