
class Identity < OmniAuth::Identity::Models::ActiveRecord
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :email 
end

