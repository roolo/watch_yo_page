# frozen_string_literal: true

# Controller for maintaining watchings
class WatchingsController < ApplicationController
  layout 'yo'
  before_action :set_watching, only: [:show, :edit, :update, :stop_watching_query, :stop_watching, :destroy]

  # GET /watchings
  # GET /watchings.json
  def index
    @watchings = @current_user.watchings
  end

  # GET /watchings/1
  # GET /watchings/1.json
  def show; end

  # GET /watchings/new
  def new
    @watching = Watching.new url: link_param
  end

  # GET /watchings/1/edit
  def edit; end

  # POST /watchings
  # POST /watchings.json
  def create
    @watching = Watching.find_or_create_by!(watching_params)

    respond_to do |format|
      if @current_user.watchings << @watching
        format.html do
          redirect_to watchings_path(username: @current_user.username),
                      notice: 'Watching was successfully created.'
        end
        format.json { render :show, status: :created, location: @watching }
      else
        format.html { render :new }
        format.json { render json: @watching.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watchings/1
  # PATCH/PUT /watchings/1.json
  def update
    respond_to do |format|
      if @watching.update(watching_params)
        format.html { redirect_to @watching, notice: 'Watching was successfully updated.' }
        format.json { render :show, status: :ok, location: @watching }
      else
        format.html { render :edit }
        format.json { render json: @watching.errors, status: :unprocessable_entity }
      end
    end
  end

  def stop_watching_query; end

  def stop_watching
    @current_user.watchings.delete @watching

    respond_to do |format|
      format.html do
        redirect_to watchings_url(username: @current_user.username),
                    notice: 'Watching was successfully stopped.'
      end
      format.json { head :no_content }
    end
  end

  # DELETE /watchings/1
  # DELETE /watchings/1.json
  def destroy
    @watching.destroy
    respond_to do |format|
      format.html { redirect_to watchings_url, notice: 'Watching was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_watching
    @watching = Watching.find(params[:id])

    Watching.create! url: watching_params[:url] if @watching.nil?

    @watching
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def watching_params
    params.require(:watching).permit(:url)
  end

  def link_param
    params.require(:link)
  end
end
