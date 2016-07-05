module Serializers
  module API
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :created_at, :updated_at

      def email
        object.email.upcase
      end

      def created_at
        object.created_at.iso8601
      end

      def updated_at
        object.updated_at.iso8601
      end
    end
  end
end
