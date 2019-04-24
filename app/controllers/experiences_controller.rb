# frozen_string_literal: true
class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  layout "admin", only: [:new, :edit]

  def show
  end

  def index
    @experiences = Experience.all
  end

  def edit
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)

    if @experience.save
      redirect_to @experience, notice: "Experience was successfully created."
    else
      render :new, alert: "Unable to save Experience"
    end
  end

  def update
    if @experience.update(experience_params)
      redirect_to edit_experience_path(@experience), notice: "Experience was successfully updated."
    else
      render :edit, alert: "Unable to save Experience"
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_url, notice: "Experience was successfully destroyed."
  end

  private
    def set_experience
      @experience = Experience.find(params[:id])
    end

    def experience_params
      params.require(:experience).permit(
        %i{name tagline overview hero_image overview_image typeAndExtraSort},
        ticket_types_attributes: {},
        extras_attributes: {}
      )
    end
end
