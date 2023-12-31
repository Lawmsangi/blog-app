FactoryBot.define do
  factory :post do
    title { 'Sample Post Title' }
    text { 'Sample post text' }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user
  end
end

FactoryBot.define do
  factory :user do
    name { 'Dudu' }
    photo { 'https://unsplash.com/photos/F_-0BxGuVvo' }
    bio { 'I am a fullstack web developer and I love to code!' }
    posts_counter { 0 }
  end
end

FactoryBot.define do
  factory :comment do
    text { 'This is a comment' }
    association :user, factory: :user
    association :post, factory: :post
  end
end

FactoryBot.define do
  factory :like do
    association :user, factory: :user
    association :post, factory: :post
  end
end
