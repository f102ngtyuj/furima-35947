class Area < ActiveHash::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item
end
