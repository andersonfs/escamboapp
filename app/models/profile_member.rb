class ProfileMember < ActiveRecord::Base

  # Associations
  belongs_to :member

  def full_name
   "#{self.first_name} #{self.second_name}"
  end

end