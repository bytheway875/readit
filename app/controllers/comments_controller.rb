class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    # Don't need to do 'new' because there are no validations
    @comment = current_user.comments.create(params[:comment]).merge(link_id: params[:link_id])
    # .merge adds the link_id to the :comment param, instead of only storing it seperately.
    redirect_to :back
  end

  private 

  # This method does the same thing as the devise provided ":authenticate_user!" action
  def redirect_back_unless_logged_in
    redirect_to :back unless current_user.present?
  end

end