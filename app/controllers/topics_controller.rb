class TopicsController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, :except => [:show, :index]
  
  def show
    @topics = Topic.all
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.publish_date = Time.now.to_datetime
    @topic.user = current_user
    p @topic
    p @topic.publish_date
    if @topic.save
      redirect_to topics_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def delete
  end
  
  def topic_params
    params.require(:topic).permit(:title, :text, :publish_date)
  end
end
