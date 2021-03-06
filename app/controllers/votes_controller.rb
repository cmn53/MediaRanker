class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.work_id = params[:work_id]
    @vote.user_id = session[:user_id]

    if @vote.save
      flash[:success] = "Successfully upvoted!"
    elsif session[:user_id] == nil
      flash[:failures] = "You must login to do that"
    else
      @vote_errors = @vote.errors.messages
      flash[:failures] = "Could not upvote: user has already voted for this work"
    end
    redirect_back(fallback_location: root_path)
  end
end
