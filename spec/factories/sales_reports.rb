# frozen_string_literal: true

# == Schema Information
#
# Table name: sales_reports
#
#  id                  :integer          not null, primary key
#  partner_id          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  written_premiums    :integer
#  policy_number       :integer
#  renewal             :boolean
#  insurer             :string(255)
#  policy_premium      :integer
#  commission_percent  :integer
#  commission_ammount  :integer
#  comments            :string(255)
#  token               :string(255)
#  registration_number :string(255)
#  calculation_token   :string(255)
#  salesforce_id       :string(255)
#

FactoryGirl.define do
  factory :sales_report do
  end
end
