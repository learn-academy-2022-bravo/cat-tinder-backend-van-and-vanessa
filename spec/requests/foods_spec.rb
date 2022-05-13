require 'rails_helper'

RSpec.describe "Foods", type: :request do
  describe "GET /index" do
    it'return a list of all foods' do
      Food.create(dishname: 'Spaghetti',
        genre: 'Italian',
        category: 'Entree',
        image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
    )
    get '/foods'
    food = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(food.length).to eq(1)
    end
  end
  describe "Post /create" do
  it 'can create a food' do
    food_params = {
      food: {
          dishname: 'Spaghetti',
          genre: 'Italian',
          category: 'Entree',
          image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
      }
    }
    post '/foods', params: food_params
    food = Food.first
    expect(response).to have_http_status(200)
    expect(food.dishname).to eq('Spaghetti')
    expect(food.genre).to eq('Italian')
    expect(food.category).to eq('Entree')
    expect(food.image).to eq('https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg')

    end
  end

  describe "PATCH / update" do
    it 'can update an existing food' do
      food_params = {
        food: {
            dishname: 'Spaghetti',
            genre: 'Italian',
            category: 'Entree',
            image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
        }
      }
    post '/foods', params: food_params
    food = Food.first

    update_food_params = {
      food: {
        dishname: 'Spaghetti',
        genre: 'Italian',
        category: 'Entree & Dinner',
        image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
      }
    }
    patch "/foods/#{food.id}", params: update_food_params
    updated_food = Food.find(food.id)
        expect(response).to have_http_status(200)
        expect(updated_food.category).to eq('Entree & Dinner')
    end
  end
  describe 'Food create request validations' do
    it "doesn't create a food without a dishname" do
      food_params = {
        food: {
            genre: 'Italian',
            category: 'Entree',
            image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
        }
      }
      post '/foods', params: food_params
      expect(response.status).to eq 422
      expect(response).to have_http_status(422)

        json = JSON.parse(response.body)
      expect(json['dishname']).to include "can't be blank"

    end
      it 'has to create a dishname with a minimum of three characters' do
        food_params = {
          food: {
              dishname: 'd',
              genre: 'Italian',
              category: 'Entree',
              image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
          }
        }      
      post '/foods', params: food_params
      json = JSON.parse(response.body)    
          expect(response).to have_http_status(422)
          expect(json['dishname'].length).to be <= 3
          # expect(json['dishname']).to include "can't be blank"
      end
    
      it "doesn't create a food without a genre" do
        food_params = {
          food: {
              dishname: 'Spaghetti',
              category: 'Entree',
              image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
          }
        }
        post '/foods', params: food_params
        expect(response.status).to eq 422
        expect(response).to have_http_status(422)

          json = JSON.parse(response.body)
        expect(json['genre']).to include "can't be blank"
    end
      it "doesn't create a food without a category" do
        food_params = {
          food: {
              dishname: 'Spaghetti',
                genre: 'Italian',
              image: 'https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg'
          }
        }
        post '/foods', params: food_params
        expect(response.status).to eq 422
        expect(response).to have_http_status(422)

          json = JSON.parse(response.body)
        expect(json['category']).to include "can't be blank"

    end

    it "doesn't create a food without an image" do
      food_params = {
        food: {
            dishname: 'Spaghetti',
              genre: 'Italian',
            category: 'Entree'
        }
      }
      post '/foods', params: food_params
      expect(response.status).to eq 422
      expect(response).to have_http_status(422)

        json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end

  end
end  