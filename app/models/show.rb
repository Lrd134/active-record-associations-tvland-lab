class Show < ActiveRecord::Base
  has_many :characters
  belongs_to :network
  def actors_list
    actors = self.characters.map { |c| c.actor_id }
    Actor.all.map do |a| 
      a.full_name if actors.include?(a.id)
    end
  end
end