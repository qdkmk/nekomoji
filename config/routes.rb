Rails.application.routes.draw do
     get 'images/ogp'
     root to: 'images#index'
end
