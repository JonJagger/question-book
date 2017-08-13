require 'sinatra/base'
require 'securerandom'
require 'fileutils'
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
    FileUtils::mkdir_p qDir
    File.write(qFilename, params['q_text'])
    redirect to('/')
  end

  get '/qid' do
    content_type :json
    if File.directory?(qDir)
      { "exists":true, "text":File.read(qFilename) }.to_json
    else
      { "exists":false }.to_json
    end
  end

  get '/answer' do
    @qId = params['q_id']
    # TODO: get question
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

  def qDir
    "/tmp/question-book/#{params['q_id'].upcase}"
  end

  def qFilename
    "#{qDir}/question.txt"
  end

end
