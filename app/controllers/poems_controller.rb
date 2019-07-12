class PoemsController < ApplicationController
  before_action :set_poem, only: [:edit, :update]

  def index
    @poems = Poem.all
  end

  def new
    @poem = Poem.new
  end

  def edit
  end

  def create
    @poem = Poem.new(poem_params)
    UserPoem.create(poem: @poem, user: @user)    

    respond_to do |format|
      if @poem.save
        format.html { redirect_to @user, notice: "Poem was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @poem.update(poem_params)
        format.html { redirect_to @poem, notice: "Poem was successfully updated." }
        format.json { render :show, status: :ok, location: @poem }
      else
        format.html { render :edit }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_poem
    @poem = Poem.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:title, :poem)
  end
end
