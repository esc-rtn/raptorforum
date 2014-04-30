class RepliesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all

    render json: @replies
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @reply = Reply.find(params[:id])

    render json: @reply
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(params[:reply])

    if @reply.save
      render json: @reply, status: :created, location: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    @reply = Reply.find(params[:id])

    if @reply.update(params[:reply])
      head :no_content
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    head :no_content
  end
end
