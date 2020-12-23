class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :coin_id
end
