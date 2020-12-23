class CoinSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image, :slug
end
