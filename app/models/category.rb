class Category < ActiveRecord::Base	
  has_many :lessons	, dependent: :destroy
  has_many :words	, dependent: :destroy
  validates :name, presence: true

  scope :order_by_created_date,-> { order("created_at DESC")}
  
end