# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  enabled    :boolean
#

FactoryGirl.define do
  factory :partner do
  end
end
