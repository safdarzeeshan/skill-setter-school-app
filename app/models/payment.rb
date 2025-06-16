class Payment < ApplicationRecord
  belongs_to :license, optional: true
  has_one :registration

  CREDIT_CARD = "credit_card"
  LICENSE = "license"
  PAYMENT_METHODS = [CREDIT_CARD, LICENSE].freeze
end
