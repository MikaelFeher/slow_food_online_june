class Restaurant < ApplicationRecord
  include ActiveModel::Validations

  validates_presence_of :name,
                        :address,
                        :zip_code,
                        :delivery_radius,
                        :phone_number,
                        :email_address,
                        :description,
                        :cuisine
  belongs_to :user

end
