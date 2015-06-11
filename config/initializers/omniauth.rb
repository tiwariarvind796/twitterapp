
Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, "586815424775277", "29af3b7e6642d1b1fdc40fc3e10700e0"
provider :twitter, "GAkZFJWIvxY8o7hk25FisalZ3", "qXktWAOrOQMlxv2BliDmHdJDE5PJbR09tHOca3gM39zR8pZlty"
                                                                                                                                                               
 provider :identity,:fields => [:email], on_failed_registration: lambda { |env|
 IdentitiesController.action(:new).call(env)
 }

end

