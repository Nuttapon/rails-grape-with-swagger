module Homemade
  class API < Grape::API
    mount Homemade::V1::Base
  end
end
