class Consumption < ApplicationRecord
    belongs_to :site
    belongs_to :stock
end
