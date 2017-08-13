require 'sinatra/base'
require 'securerandom'
require 'json'

class QuestionBook < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/ask' do
    @qId = qid
    erb :ask
  end

  post '/asked' do
    # TODO: params['q_id'], params['q_text']
    # TODO: save question
    redirect to('/')
  end

  get '/qid' do
    content_type :json
    { "exists":true, "text":"what is your favourite colour?" }.to_json
  end

  get '/answer' do
    # TODO: use params['q_id'] to get question
    erb :answer
  end

  post '/answered' do
    redirect to("/read?q_id=#{params['q_id']}")
  end

  get '/read' do
    @qId = params['q_id']
    # TODO: lookup q_text
    @qText = "what is your favourite colour"
    erb :read
  end

private

  def qid
    SecureRandom.hex[0..5].upcase
  end

end
