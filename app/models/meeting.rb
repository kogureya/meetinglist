class Meeting < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :date, :time, :title, :client
  end
end
