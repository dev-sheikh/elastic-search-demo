require 'rails_helper'
require 'faker'

RSpec.describe ArticlesController, type: :controller do
  fixtures :all
  let(:article) { FactoryBot.create(:article)}

  def new
    @article = Article.new
  end
 
  describe 'GET #index' do
    it 'expect article to be intialize'
      expect(article).to be_instance_of(Article)
    end
  end

  describe 'GET #index' do
    before do
      get :index
    end 
   
    context 'expect responce to article present' do 
      it "articles to be present" do
        articles = Article.all
       expect(articles).not_to be_nil
      end

      it "expect responce to" do
        expect(response.status).to eq(200)
      end
    end
   
    context 'expect no articles to be there' do 
      it "if article not present" do
        order = Article.new()
        expect(article.id).to be_nil
        message = JSON.parse(response.body).first[1]
        expect(message).to eq("No Article present")
      end
    end
  end

  describe 'GET #show' do
    before do 
      get :show
    end

    context 'reponse is correct' do
      it "article to be present" do
        expect(article.id).not_to be_nil
      end

      it "expect responce to" do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST #create' do
    before do
      post 'create'
    end

    context 'when params are correct' do
      it 'is expected to create new order successfully' do
        expect(order).to be_instance_of(BxBlockShoppingCart::Order)
        # expect(response).to have_http_status(:created)
      end
    end

    context 'when params are not correct' do
      it 'is expect order not to be created' do
        order = BxBlockShoppingCart::Order.new()
        # message = JSON.parse(response.body).first[1]
        message = JSON.parse(response.body).first[1].first.first[1]
        expect(message).to eq("Invalid token")
        # expect(response.status).to eq(400)
      end
    end
  end
    
  describe "put #update" do
  
    context "order to be successfully updated" do 
      it "order id should be in present" do
        expect(order.id).not_to be_nil
      end
    end
   
    context "order not be updated" do
      order = Article::Order.new()
      it 'order not to be found' do 
        expect(order.id).to be_nil
      end
    end
  end
end