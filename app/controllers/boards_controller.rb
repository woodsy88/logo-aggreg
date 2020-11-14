class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_board, only: [:show, :edit, :update]
  def index
    @boards = current_user.boards
  end

  def show
    puts "#{@board.name} farts"
  end

  def new
    @board = Board.new
  end

  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.user = current_user
    respond_to do |format|
      if @board.save
        format.html { redirect_to root_path, notice: 'board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
        # format.js
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
        # format.js
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
        # format.js
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
        # format.js
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:user_id, :name)
  end


end
