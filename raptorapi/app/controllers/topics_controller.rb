class TopicsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all

    render json: @topics
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])

    render json: @topic
  end

  #GET /topics/1/replies
  def getReplies
    @replies = Reply.where(topic_id = params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new()

    @topic.title = params[:title]
    @topic.content = params[:content]
    @topic.poster = params[:poster]

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    if @topic.update(params[:topic])
      head :no_content
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    head :no_content
  end
end
