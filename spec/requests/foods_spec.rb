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
end
