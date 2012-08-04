OurOrderOnline::Engine.routes.draw do
  match '/ws(/:action)' => "base"
end
