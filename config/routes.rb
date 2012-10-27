Marcus::Application.routes.draw do
  match '/', to: 'main#home'
  match '/about', to: 'main#about'
  resources :books

  resources :chapters

  resources :paragraphs

end
