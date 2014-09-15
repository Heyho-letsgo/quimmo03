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


  has_attached_file :image,
                    :styles => { :medium => "x300", :thumb => "x100" },
                    :storage => :s3,
                    :bucket => 'obscure-caverns-5201',
                    :s3_credentials => S3_CREDENTIALS

  validates_attachment :image, :content_type => { :content_type => ['image/jpeg', 'image/png'] }, :size => { :less_than => 1.megabyte }
  validates_attachment_presence :image

end

