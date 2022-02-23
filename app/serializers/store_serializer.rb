class StoreSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :price
end
