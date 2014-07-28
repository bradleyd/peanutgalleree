# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :painting do
    name "MyString"
    description "MyString"
    gallery_id 1
    image_size 1
    image_type "MyString"
    image "MyString"
  end
end
