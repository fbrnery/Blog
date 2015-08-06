require "test_helper"

describe ArticlesController do
  let(:article) { articles :one }

  it "gets index" do
    get :index
    response.must_be :success?
    assigns(:articles).wont_be :nil?
  end

  it "gets new" do
    get :new
    response.must_be :success?
    assigns(:article).must_be :new_record?
  end

  it "creates article" do
    expect {
      post :create, article: { body: article.body, published_at: article.published_at, title: article.title }
    }.must_change "Article.count"

    must_redirect_to assigns :article

    flash[:notice].must_equal 'Article was successfully created.'
  end

  it "shows article" do
    get :show, id: article
    response.must_be :success?
  end

  it "gets edit" do
    get :edit, id: article
    response.must_be :success?
  end

  it "updates article" do
    put :update, id: article, article: { body: article.body, published_at: article.published_at, title: article.title }

    flash[:notice].must_equal 'Article was successfully updated.'

    must_redirect_to assigns :article
  end

  it "destroys article" do
    expect {
      delete :destroy, id: article
    }.must_change "Article.count", -1

    flash[:notice].must_equal 'Article was successfully destroyed.'

    must_redirect_to articles_path
    end
  end
