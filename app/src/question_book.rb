require 'sinatra/base'

class QuestionBook < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/ask' do
    # TODO: generate the UUID
    @qid = '4391E0'
    erb :ask
  end

  post '/asked' do
    # TODO: save question
    redirect to('/')
  end

  get '/answer' do
    # TODO: use QID to get question
    erb :answer
  end

  post '/answered' do
    # TODO: Save answer
    # TODO: redirect to read
  end

  get '/read' do
    # TODO:
    erb :read
  end

end
