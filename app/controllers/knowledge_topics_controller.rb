class KnowledgeTopicsController < ApplicationController
  before_action :set_knowledge_topic, only: [:show, :edit, :update, :destroy]

  # GET /knowledge_topics
  # GET /knowledge_topics.json
  def index
    @knowledge_topics = KnowledgeTopic.all
  end

  # GET /knowledge_topics/1
  # GET /knowledge_topics/1.json
  def show
  end

  # GET /knowledge_topics/new
  def new
    @knowledge_topic = KnowledgeTopic.new
  end

  # GET /knowledge_topics/1/edit
  def edit
  end

  # POST /knowledge_topics
  # POST /knowledge_topics.json
  def create
    @knowledge_topic = KnowledgeTopic.new(knowledge_topic_params)

    respond_to do |format|
      if @knowledge_topic.save
        format.html { redirect_to @knowledge_topic, notice: 'Knowledge topic was successfully created.' }
        format.json { render :show, status: :created, location: @knowledge_topic }
      else
        format.html { render :new }
        format.json { render json: @knowledge_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledge_topics/1
  # PATCH/PUT /knowledge_topics/1.json
  def update
    respond_to do |format|
      if @knowledge_topic.update(knowledge_topic_params)
        format.html { redirect_to @knowledge_topic, notice: 'Knowledge topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @knowledge_topic }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_topics/1
  # DELETE /knowledge_topics/1.json
  def destroy
    @knowledge_topic.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_topics_url, notice: 'Knowledge topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge_topic
      @knowledge_topic = KnowledgeTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledge_topic_params
      params.require(:knowledge_topic).permit(:knowledge_area, :knowledge_unit, :knowledge_topic, :year_added, :active, :correct_answers, :incorrect_answers, :temp_correct_answer, :temp_incorrect_answer)
    end
end
