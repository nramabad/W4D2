# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(brown black) }
  validates :sex, inclusion: { in: %w(M F) }

  def age
    (Date.today.to_time.to_i - birth_date.to_time.to_i)/(60 * 60 * 24 * 365)
  end

end
