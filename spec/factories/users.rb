# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    email      Faker::Internet.email
    username   Faker::Internet.user_name
    password   Faker::Internet.password(6)
  end
end
