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
      { "exists":true, "text":qText }.to_json
    else
      { "exists":false }.to_json
    end
  end

  get '/answer' do
    erb :answer
  end

  post '/answered' do
    redirect to("/read?q_id=#{params['q_id']}")
  end

  get '/read' do
    @qId = params['q_id']
    @qText = qText
    erb :read
  end

private

  def qid
    SecureRandom.hex[0..3].upcase
  end

  def qDir
    "/tmp/question-book/#{params['q_id'].upcase}"
  end

  def qFilename
    "#{qDir}/question.txt"
  end

  def qText
    File.read(qFilename)
  end

end
