class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]	
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index

#<%= highlight('You searched for rails', 'rails')

	if params[:detail].present? #|| params[:commit].present?
    	@ideas = Idea.where(:name => params[:search])
    	@detail = true
    	@lock_select = true
    	@lock_select_submit = true
    end

	if params[:search].present?
    	@ideas = Idea.where(:name => params[:search])
    	@detail = true
    	@lock_select = true
    	@lock_select_submit = true
    end

	if params[:filter].present?
    	@ideas = Idea.where(:id => params[:filter])
       	@detail = true
    	@lock_select = true
    	@lock_select_submit = true
  	else
  		@ideas = Idea.all
  		@detail = true
  		@lock_select = false
    	@lock_select_submit = false
    end

  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = current_user.ideas.new

  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea }
      else
        format.html { render action: 'new' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :user_id)
    end
end
