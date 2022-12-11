class PollsController < ApplicationController
  before_action :set_poll, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:show]

  # GET /polls
  def index
    @polls = Poll.joins(:votes).where(user_id: current_user.id).or(Poll.joins(:votes).where(votes: {user_id: current_user.id}))
  end

  # GET /polls/1
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  def create
    @poll = Poll.new(poll_params.merge(user_id: current_user.id))

    if @poll.save
      redirect_to @poll, notice: "Poll was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /polls/1
  def update
    if @poll.update(poll_params)
      redirect_to @poll, notice: "Poll was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /polls/1
  def destroy
    @poll.destroy
    redirect_to polls_url, notice: "Poll was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_poll
    @poll = Poll.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def poll_params
    params.require(:poll).permit(:question)
  end
end
