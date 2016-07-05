module Homemade
  module V1
    class Users < Grape::API
      resources :users do
        desc 'Return all users.'
        params do
          optional :page, type: Integer
        end

        get do
          users = User.all.page(params[:page]).per(2)
          serializer = Serializers::API::UserSerializer
          present data: ActiveModel::ArraySerializer.new(users).serializable_array,
            meta: pagination_dict(users)
        end

        desc "New user."
        params do
          requires :name, type: String, desc: "User's name"
          requires :email, type: String, desc: "User's email"
        end

        post do
          user = User.new(
            name: params[:name],
            email: params[:email],
          )

          if user.valid?
            user.save
          else
            error!({ error_code: 422, error_message: user.errors.full_messages.join(', ') }, 422)
          end

          present Serializers::API::UserSerializer.new(user).serializable_hash
        end
      end
    end
  end
end
