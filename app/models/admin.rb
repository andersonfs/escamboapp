# frozen_string_literal: true

class Admin < ApplicationRecord
  rolify

  #enums
  #enum role: {:full_access => 0, :restricted_access => 1}

  #scopes
  #scope :with_full_access, -> { where(role: :full_access) }
  
=begin
  def self.with_restricted_access
    where(role: :restricted_access)
  end
=end

  scope :with_restricted_access, -> { with_role(Role.availables[1]) } # restricted_access

  def checked_roles
    self.roles.collect do |role|
      role.name
    end
  end

  def roles_descriptions
    self.roles.collect do |role|
      Role::OPTIONS[role.name.to_sym]
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  
end
