class TopicsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  respond_to :json

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new()

    @topic.title = params[:title]
    @topic.content = params[:content]
    @topic.poster = params[:poster]

    respond_to do |format|
      if @topic.save
        format.json { render :show, status: :created, location: @topic }
      else
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.json { render :show, status: :ok, location: @topic }
      else
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:title, :content).permit(:postdate, :poster)
    end
end
