Rails.application.routes.draw do
  mount Homemade::API => '/api'
  mount GrapeSwaggerRails::Engine => '/docs'
end
