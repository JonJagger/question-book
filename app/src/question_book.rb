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
    FileUtils::mkdir_p dir
    File.write(filename, params['question'].strip)
    redirect to('/')
  end

  get '/answer' do
    @id = id
    erb :answer
  end

  get '/book' do
    content_type :json
    { 'question':question, 'answers':answers }.to_json
  end

  post '/answered' do
    File.write("#{dir}/#{random_id}.txt", answer)
    redirect to("/read?id=#{id}")
  end

  get '/answers' do
    content_type :json
    { answers:answers }.to_json
  end

  get '/read' do
    @id = id
    @question = question
    @answers = answers
    @answers = %w( jon bert ernie fred alice andy carol denzil paul ).sort
    erb :read
  end

private

  def random_id
    SecureRandom.hex[0..3].upcase
  end

  def id
    (params['id'] || '').upcase
  end

  def answer
    params['answer']
  end

  def answers
    Dir.glob("#{dir}/*.txt").collect { |filename|
      File.read(filename).strip
    }
  end

  def dir
    "/tmp/question-book/#{id}"
  end

  def filename
    "#{dir}/question.text"
  end

  def question
    File.file?(filename) ? File.read(filename) : ''
  end

end
