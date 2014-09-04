class Agence < ActiveRecord::Base

  validates :raison_sociale, presence: true
  validates :num_rue, presence: true
  validates :adresse01l01, presence: true
  validates :code_postal, presence: true
  validates :ville, presence: true
  validates :pays, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }



end
