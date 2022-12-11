class VotesController < ApplicationController
  def create
    @vote = Vote.new(poll_id: params[:poll_id], poll_answer_id: params[:poll_answer_id], user_id: current_user.id)

    respond_to do |format|
      if current_user.votes.where(poll_id: params[:poll_id]).any?
        format.html { redirect_to poll_results_url(@vote.poll), notice: "You already voted" }
      elsif @vote.save
        format.html { redirect_to poll_results_url(@vote.poll), notice: "Vote was successfully created." }
      else
        format.html { redirect_to poll_url(@vote.poll), notice: "Something went wrong" }
      end
    end
  end
end
