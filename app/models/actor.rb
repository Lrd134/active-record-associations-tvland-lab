class Actor < ActiveRecord::Base
  has_many :characters
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def list_roles
    roles = self.characters.map do | chars |
        show = Show.find_by(:id => chars.show_id)
        "#{chars.name} - #{show.name}"
    end
  end
end