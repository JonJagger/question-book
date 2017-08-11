require 'sinatra/base'

class QuestionBook < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/ask' do
    @qid = '4391E0'
    erb :ask
  end

  post '/asked' do
    redirect to('/')
  end

  get '/answer' do
  end

  post '/answered' do
  end

end
