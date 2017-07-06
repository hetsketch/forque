# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.posted_date = DateTime.now
    @comment.save!
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
