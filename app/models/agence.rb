class Agence < ActiveRecord::Base
  has_many :users
  validates :raison_sociale, presence: true
  validates :num_rue, presence: true
  validates :adresse01l01, presence: true
  validates :code_postal, presence: true
  validates :ville, presence: true
  validates :pays, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: {case_sensitive: false}

  has_attached_file :image
  validates_attachment :image,
                       :content_type => { :content_type => ['image/jpeg', 'image/png'] },
                       :size => { :less_than => 1.megabyte }


end

