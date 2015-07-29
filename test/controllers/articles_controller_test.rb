require "test_helper"

describe ArticlesController do
  let(:article) { articles :one }

  it "gets index" do
    get :index
    value(response).must_be :success?
    value(assigns(:articles)).wont_be :nil?
  end

  it "gets new" do
    get :new
    value(response).must_be :success?
  end

  it "creates article" do
    expect {
      post :create, article: { body: article.body, published_at: article.published_at, title: article.title }
    }.must_change "Article.count"

    must_redirect_to article_path(assigns(:article))
  end

  it "shows article" do
    get :show, id: article
    value(response).must_be :success?
  end

  it "gets edit" do
    get :edit, id: article
    value(response).must_be :success?
  end

  it "updates article" do
    put :update, id: article, article: { body: article.body, published_at: article.published_at, title: article.title }
    must_redirect_to article_path(assigns(:article))
  end

  it "destroys article" do
    expect {
      delete :destroy, id: article
    }.must_change "Article.count", -1

    must_redirect_to articles_path
  end
end
