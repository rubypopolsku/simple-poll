class PollAnswersController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
    @answer = @poll.poll_answers.build
  end

  def create
    @poll = Poll.find(params[:poll_id])

    @answer = @poll.poll_answers.build(answer_params)

    if @answer.save
      redirect_to @poll, notice: "Answer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:poll_answer).permit(:answer)
  end
end
