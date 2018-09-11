# frozen_string_literal: true

class Member < ApplicationRecord

  # RatyRate Gem
  ratyrate_rater

  # Associations
  has_many :ads

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
