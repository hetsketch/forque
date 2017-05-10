class TopicsController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, :except => [:show, :index]
  
  def index
    @topics = Topic.all
  end
  
  def show
    @topic = Topic.find_by(id: params[:id])
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic              = Topic.new(topic_params)
    @topic.publish_date = Time.now.to_datetime
    @topic.author       = current_user
    if @topic.save
      redirect_to topics_path
    else
      render 'new'
    end
  end
  
  def edit
    @topic = Topic.find_by(id: params[:id])
    if @topic && @topic.author == current_user
      render 'edit'
    else
      redirect_to topics_path
    end
  end
  
  def update
    Topic.update(topic_params)
    redirect_to topic_path
  end
  
  def destroy
    @topic = Topic.find_by(id: params[:id])
    if @topic
      @topic.destroy
    end
    redirect_to topics_path
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title, :text, :publish_date)
  end
end
