module OurOrderOnline
  class Engine < Rails::Engine
    isolate_namespace OurOrderOnline
    
    initializer "our_order_online.merge_public" do |app|
      app.middleware.insert_before Rack::Lock, ::ActionDispatch::Static, "#{root}/public"
    end

    engine = self
    config.to_prepare do
      ErpBaseErpSvcs.register_compass_ae_engine(engine)
    end
    
  end
end
