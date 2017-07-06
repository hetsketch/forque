# frozen_string_literal: true

FactoryGirl.define do
  factory :event do
    sequence(:title) { |n| "#{Faker::Lorem.words(8)}#{n}" }
    sequence(:text)  { |n| "#{Faker::Lorem.paragraph(5)}#{n}" }
    start_time       Faker::Time.backward
    end_time         Faker::Time.forward

    association :author, factory: :user
  end
end
