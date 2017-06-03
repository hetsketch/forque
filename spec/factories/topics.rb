# frozen_string_literal: true

FactoryGirl.define do
  factory :topic do
    title        Faker::Lorem.sentence
    text         Faker::Lorem.paragraphs
    publish_date Faker::Date.forward

    association :author, factory: :user
  end
end
