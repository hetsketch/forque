# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    sequence(:email)    { |n| "#{Faker::Internet.email}#{n}" }
    sequence(:username) { |n| "#{Faker::Internet.user_name}#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
