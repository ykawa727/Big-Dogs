class HomesController < ApplicationController
  before_action :authenticate_dog_owner!,except: [:top, :about]

  def top
  end

  def about
  end
end
