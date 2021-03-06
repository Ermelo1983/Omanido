class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true,
            :length => { :maximum => 50}
  validates :description, presence: true,
           :length => { :maximum => 500}
  validates :short_description, presence: true,
            :length => { :maximum => 100}
  validates :price, presence: true,
            :numericality => true
  # validates :brand, presence: true,
  #           :length => { :maximum => 50},
  #           :allow_nil => true
  # validates :image, presence: true,
  #           :allow_nil => true
  # validates :color, presence: true,
  #           :allow_nil => true
  validates :amount, presence: true,
            :numericality => true
  # validates :for_female, presence: true,
  #           :allow_nil => true
  # validates :for_male, presence: true,
  #           :allow_nil => true
  # validates :featured, presence: true,
  #           :allow_nil => true
  validates :category, presence: true

  def self.search(search)
    where("name iLIKE ?", "%#{search}%")
  end

  def self.order_by_name
    order(:name)
  end

  def is_featured?
    featured == true
  end

  def self.order_asc
    order('name ASC')
  end

  def self.order_desc
    order('name DESC')
  end

  # def self.order_by_date
  #   order(:date)
  # end

  def self.order_by_category
    joins(:category).order('categories.name')
  end


end
