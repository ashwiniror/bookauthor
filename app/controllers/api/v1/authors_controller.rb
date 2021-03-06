class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # GET /authors
  # GET /authors.json
  def index
    #json_response "Inndex reviews successfully", true, {authors: @authors}, :ok
    @authors = Author.all
    render json: {
      messages: "author index successfully",
      is_success: true,
      data:{
        authors: @authors
      }
    },status: :ok
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    render json: {
      messages: "author info",
      is_success: true,
      data:{
        author: @author, book: @author.books
      }
    },status: :ok
  
  end
    
  
  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json

  def create
    @author = Author.new(author_params)
    respond_to do |format|
      if @author.save
       json_response "Created author successfully", true, {author: @author}, :ok
      else
        json_response "Created author fail", false, {}, :unproccessable_entity
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json

  def destroy
    
      if @author.destroy
        render json: {
              messages: "Author was successfully destroyed.",
              is_success: true,
              data:{
              }
            },status: :ok
      else
        render json: {
              messages: "Deleted author fail",
              is_success: false,
              data:{
              }
            },status: :unproccessable_entity
       
      end
    
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:first_name, :last_name, :dob)
    end
end
def destroy
    
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end