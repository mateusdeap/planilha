class Transaction < ApplicationRecord
  enum :kind, [:expense, :revenue]
end
