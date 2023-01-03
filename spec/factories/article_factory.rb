# frozen_string_literal: true
FactoryBot.define do
  factory :article, class: "Article" do
    title { article }
    body { hello }
  end
end
