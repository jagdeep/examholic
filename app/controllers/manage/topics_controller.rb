class Manage::TopicsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :find_subject
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @topics = @subject.topics.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.subject_id = @subject.id

    respond_to do |format|
      if @topic.save
        format.html { redirect_to manage_account_subject_topics_path(@current_account, @subject), notice: 'Topic was successfully added.' }
        format.json { render :show, status: :created, location: manage_account_subject_topics_path(@current_account, @subject) }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to manage_account_subject_topics_path(@current_account, @subject), notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to manage_account_subject_topics_path(@current_account, @subject), notice: 'Topic was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_subject
      @subject = Subject.where(:id => params[:subject_id]).first
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.where(:id => params[:id], :subject_id => params[:subject_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:subject_id,:name)
    end
end
