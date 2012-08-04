module OurOrderOnline
  class BaseController < ActionController::Base
    #before_filter :require_login

    def create_new_order
      order = create_new_with_token

      render :json => {:success => true, :order => order.to_json_hash}
    end

    def retrieve_order
      token = params[:token]
      order = Order.find_by_token(token)

      if order
        render :json => {:success => true, :order => order.to_json_hash}
      else
        render :json => {:success => false, :message => 'Could Not Find Order'}
      end
    end

    protected
    def is_ajax_request?
      request.xhr? || params[:callback]
    end

    def not_authenticated
      if is_ajax_request?
        if params[:callback]
          render :json => {:success => false, :errors => {:reason => 'Unauthenticated Request'}}, :callback => params[:callback]
        else
          render :json => {:success => false, :errors => {:reason => 'Unauthenticated Request'}}
        end
      else
        render :text => 'Unauthenticated Request'
      end
    end

  end #BaseController
end #OurOrderOnline
