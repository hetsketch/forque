# frozen_string_literal: true

FactoryGirl.describe do
  factory :event do
    title      Faker::Lorem.sentence
    text       Faker::Lorem.sentences
    start_time Faker::Time.backward
    end_time   Faker::Time.forward

    attributes :author, factory: :user
  end
end
