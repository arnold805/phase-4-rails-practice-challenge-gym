class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    # validates in default Ruby, validate is DLC
    validates :charge, presence: true
    validates :client, uniqueness: { scope: :gym }
    # validates :client, uniqueness: :gym
end
