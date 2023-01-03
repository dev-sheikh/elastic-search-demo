class Article < ApplicationRecord
  searchkick word_start: [:title], highlight: [:title] unless Rails.env.eql?('test')
end
