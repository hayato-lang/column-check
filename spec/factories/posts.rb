FactoryBot.define do
  factory :post do
    title            {"２人の落語家"}
    description      {"二人の落語家ってどう表現しますか？"}
    association :user
  end
end
