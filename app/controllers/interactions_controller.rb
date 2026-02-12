class InteractionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interaction, only: %i[ show edit update destroy ]
  before_action :set_interactable_options, only: %i[ new create edit update ]

  def index
    @interactions = Interaction.includes(:interactable).all.order(occurred_at: :desc)
  end

  def show
  end

  def new
    @interaction = Interaction.new
    if params[:customer_id]
      @interaction.interactable = Customer.find(params[:customer_id])
    elsif params[:lead_id]
      @interaction.interactable = Lead.find(params[:lead_id])
    end
  end

  def edit
  end

  def create
    @interaction = Interaction.new(interaction_params)

    if @interaction.save
      redirect_to interactions_path, notice: "Interaction was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @interaction.update(interaction_params)
      redirect_to interactions_path, notice: "Interaction was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @interaction.destroy!
    redirect_to interactions_path, notice: "Interaction was successfully destroyed."
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def set_interactable_options
      @customers = Customer.all
      @leads = Lead.all
    end

    def interaction_params
      params.require(:interaction).permit(:interaction_type, :occurred_at, :notes, :interactable_id, :interactable_type)
    end
end
