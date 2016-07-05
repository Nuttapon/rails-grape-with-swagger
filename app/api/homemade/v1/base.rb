require 'grape-swagger'

module Homemade
  module V1
    class Base < Grape::API
      version 'v1'
      format :json
      helpers Homemade::V1::Helpers::Pagination

      mount Homemade::V1::Users

      add_swagger_documentation(
        core: true,
        mount_path: "/docs",
        base_path: "/api",
        api_version: "v1",
        hide_format: true,
        hide_documentation_path: true
      )
    end
  end
end
