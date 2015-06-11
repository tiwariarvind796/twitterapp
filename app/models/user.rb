  class User < ActiveRecord::Base

    has_many :identities
    # validates :email, :presence => true, 
    #             :length => {:minimum => 3, :maximum => 254}
                

     
     def self.from_omniauth(auth)
     User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
     end


     def self.create_with_omniauth(auth)
     user_obj = create! do |user|
     user.provider = auth["provider"]
     user.uid = auth["uid"]
     user.name = auth["info"]["name"]
     user.email = auth["info"]["email"]
     user.image  =auth["info"]["image"]
     end
  end
end