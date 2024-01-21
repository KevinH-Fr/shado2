# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  def new
    super
  end
  
  def after_sign_up_path_for(resource)
    steps_user_fan_account_path
  end

  def index  
  end
  
  def edit
    super
  end

  def update
    super
  end
  
  private


end

