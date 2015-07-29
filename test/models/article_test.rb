require "test_helper"

describe Article do
  let(:article) { Article.new }

  it "must validate article title presence" do
    article.title = '    '
    article.must_be :invalid?
    article.errors[:title].must_include "can't be blank"
  end

  it "must validate article body presence" do
    article.body = '    '
    article.must_be :invalid?
    article.errors[:body].must_include "can't be blank"
  end
end
