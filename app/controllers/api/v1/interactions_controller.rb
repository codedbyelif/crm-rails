class Api::V1::InteractionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interactable, only: %i[ index ]
  before_action :set_interaction, only: %i[ show update destroy ]

  def index
    if @interactable
      @interactions = @interactable.interactions
    else
      @interactions = Interaction.all
    end
    render json: @interactions
  end

  def show
    render json: @interaction
  end

  def create
    @interaction = Interaction.new(interaction_params)

    if @interaction.save
      render json: @interaction, status: :created
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @interaction.update(interaction_params)
      render json: @interaction
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @interaction.destroy!
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def set_interactable
      if params[:customer_id]
        @interactable = Customer.find(params[:customer_id])
      elsif params[:lead_id]
        @interactable = Lead.find(params[:lead_id])
      end
    end

    def interaction_params
      params.require(:interaction).permit(:interaction_type, :occurred_at, :notes, :interactable_id, :interactable_type)
    end
end
