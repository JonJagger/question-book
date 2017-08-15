require 'sinatra/base'
require 'securerandom'
require 'fileutils'
require 'json'

class QuestionBook < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/ask' do
    @id = random_id
    erb :ask
  end

  post '/asked' do
    FileUtils::mkdir_p qDir
    File.write(qFilename, params['question'])
    redirect to('/')
  end

  get '/is_id' do
    content_type :json
    if File.directory?(qDir)
      { 'exists':true, 'text':question }.to_json
    else
      { 'exists':false }.to_json
    end
  end

  get '/answer' do
    erb :answer
  end

  post '/answered' do
    File.write("#{qDir}/#{random_id}.txt", answer)
    redirect to("/read?id=#{id}")
  end

  get '/read' do
    @id = id
    @question = question
    @answers = Dir.glob("#{qDir}/*.txt").collect { |filename|
      File.read(filename).strip
    }
    #@qAnswers = %w( jon bert ernie fred alice andy carol denzil paul ).sort
    erb :read
  end

private

  def random_id
    SecureRandom.hex[0..3].upcase
  end

  def id
    params['id']
  end

  def answer
    params['answer']
  end

  def qDir
    "/tmp/question-book/#{id.upcase}"
  end

  def qFilename
    "#{qDir}/question.text"
  end

  def question
    File.read(qFilename)
  end

end
