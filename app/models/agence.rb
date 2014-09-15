class Agence < ActiveRecord::Base
  has_many :users
  validates :raison_sociale, presence: true
  validates :num_rue, presence: true
  validates :adresse01l01, presence: true
  validates :code_postal, presence: true
  validates :ville, presence: true
  validates :pays, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: {case_sensitive: false}
  validates :image, presence: true


  has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
  }

  validates_attachment :image, :content_type => { :content_type => ['image/jpeg', 'image/png'] }, :size => { :less_than => 1.megabyte }
  validates_attachment_presence :image

end

