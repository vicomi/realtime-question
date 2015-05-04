require 'sinatra/base'

module RealtimeApi
  class App < Sinatra::Base

    get "/" do
      erb :"index.html"
    end

    get '/feelback' do
      content_type :json
      url = params[:ur]
      category_id = params[:category]
      lat = params[:lat]
      long = params[:long]

      $votes = 0 if $votes == nil
      $votes = $votes + 1
      if $clients != nil
        $clients.each {|client| client.send($votes) }
      else
        puts 'no clients to message'
      end

      { votes: $votes }.to_json
    end
  end
end
