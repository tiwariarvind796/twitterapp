class IdentitiesController < ApplicationController

   def new
   @identity = env['omniauth.identity']
   end

   def index
   end

   def create    
   end
end