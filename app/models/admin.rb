# frozen_string_literal: true

class Admin < ApplicationRecord

  #enums
  enum role: {:full_access => 0, :restricted_access => 1}

  #scopes
  scope :with_full_access, -> { where(role: :full_access) }
  
  def self.with_restricted_access
    where(role: :restricted_access)
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  
end
