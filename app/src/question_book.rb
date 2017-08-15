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
      { 'exists':true, 'text':qText }.to_json
    else
      { 'exists':false }.to_json
    end
  end

  get '/answer' do
    erb :answer
  end

  post '/answered' do
    File.write("#{qDir}/#{qid}.txt", params['answer'])
    redirect to("/read?q_id=#{params['q_id']}")
  end

  get '/read' do
    @qId = params['q_id']
    @qText = qText
    @qAnswers = Dir.glob("#{qDir}/*.txt").collect { |filename|
      File.read(filename).strip
    }
    #@qAnswers = %w( jon bert ernie fred alice andy carol denzil paul ).sort
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
    "#{qDir}/question.text"
  end

  def qText
    File.read(qFilename)
  end

end
