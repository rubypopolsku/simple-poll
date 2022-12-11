class VotesController < ApplicationController
    def create
      @vote = Vote.new(poll_id: params[:poll_id], poll_answer_id: params[:poll_answer_id])

      respond_to do |format|
        if @vote.save
          format.html { redirect_to poll_url(@vote.poll), notice: "Poll was successfully created." }
        else
          format.html { redirect_to poll_url(@vote.poll), notice: "Something went wrong" }
        end
      end
    end
  end
