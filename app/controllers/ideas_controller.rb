class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]	
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index

	#<%= highlight('You searched for rails', 'rails')

	@robot= nil
  	@robot_random_name = ('A'..'Z').to_a.sample(3).join + rand(10000...999999).to_s
	@robot = "http://robohash.org/" + @robot_random_name

  	@stage = 1

	# CHECKBOXES
	if params[:filter_values].present?
    	@ideas = Idea.where(:id => params[:filter_values]).paginate(:page => params[:page], :per_page => 5)
    	@lock_select = true
    	@lock_select_submit = true
  	elsif !params[:filter_values].present?
  		@ideas = Idea.all.paginate(:page => params[:page], :per_page => 5)
  		@lock_select = false
    	@lock_select_submit = false
    end
	
	# SEARCH FIELD
	if params[:idea_name].present?
    	#@ideas = Idea.where(:name => params[:idea_name])

	    @x = "%#{params[:idea_name]}%"
	    @ideas = Idea.where("name ilike ? or description ilike ?", @x.downcase, @x.downcase).paginate(:page => params[:page], :per_page => 5) unless params[:idea_name].blank?
	    #@ideas = Idea.where("name ilike ? or description ilike ?", @x.downcase, @x.downcase).paginate(:page => params[:page], :per_page => 5) unless params[:idea_name].blank?

    	@detail = false
    	@lock_select = true
    	@lock_select_submit = true
    end


  end

  # GET /ideas/1
  # GET /ideas/1.json

  def details
  	@ideas = Idea.where(:id => params[:ideas_ids]).paginate(:page => params[:page], :per_page => 5)

  	@stage = 2
  end

  def results

	
    # ideas_names_mod = params[:ideas_names] #string
    # @ideas_names = ideas_names_mod.gsub(/[' ']/, '+').capitalize
    
    # if params[:ideas_names].present? 
    #     url_mod = "http://api.whatthetrend.com/api/v2/trends.json" # + @ideas_names
    #     url_buffer = HTTParty.get(url_mod)
    #     url_hash = JSON.parse(url_buffer) # uses Ruby to convert to hash
    #     @twitter_trend = JSON.parse(url_buffer)["query"] # access value of year directly
    #     #@display_movie = url_buffer
    #     #binding.pry
    #     #gem pry
    #     #gem pry-debugger
    # end
	
  	@ideas = Idea.where(:name => params[:ideas_names]).paginate(:page => params[:page], :per_page => 5)

  	@stage = 3
  end

  def results2
  	@ideas = Idea.where(:name => params[:ideas_names]).paginate(:page => params[:page], :per_page => 5)

  	@stage = 4
  end

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
