class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/' do
    { message: "Hello world" }.to_json
  end
  get '/games' do 
    games = Game.all.order(:title).limit(15)
    games.to_json(include: :reviews)
  end

  get '/games/:id' do
    game = Game.find(
    params[:id]
    )
    game.to_json(only: [:id, :title, :genre, :price],include:{ reviews: { only: [:comment, :score],include: {users:{only [:name]}}} })

  end

end
