class CatsController < ApplicationController
  before_action :find_cat, only: [:show, :edit, :update, :destroy]

  def index
  if params[:category].blank?  
  @cats = Cat.all.order("Created_at DESC")
  else
    @category_id = Category.find_by(name: params[:category]).id
    @cats = Cat.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
  #	@cat = Cat.find(params[:id])
  end	

  def new
  	@cat = current_user.cats.build
    @categories = Category.all.map{ |c| [c.name, c.id] } 
  end

  def create
  	@cat = current_user.cats.build(cat_params)
    @cat.category_id = params[:category_id]

  
  if @cat.save
  	redirect_to root_path
  else
  	render 'new'
   end
  end 
 
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }  
  end

  def update
    @cat.category_id = params[:category_id]
  	if @cat.update(cat_params)
  		redirect_to cat_path(@cat)
  	else
  		render 'edit'
  	end
  end

  def destroy
  @cat.destroy
  redirect_to root_path
  end	


  private

    def cat_params
    params.require(:cat).permit(:name, :color, :race, :gender, :description, :category_id, :cat_img) 
    end 	
    
    def find_cat
       @cat = Cat.find(params[:id])
    end 	
end
