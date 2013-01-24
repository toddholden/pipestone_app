class AnimalsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @animals }
    end
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
    @animal = Animal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @animal }
    end
  end

  # GET /animals/new
  # GET /animals/new.json
  def new
    @animal = Animal.new
    @animal.person_id = params[:person_id]
    @people = Person.all(:order => :lastname)
  end

  # GET /animals/1/edit
  def edit
    @animal = Animal.find(params[:id])
    @people = Person.all(:order => :lastname)
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(params[:animal])

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render json: @animal, status: :created, location: @animal }
      else
        format.html { render action: "new" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /animals/1
  # PUT /animals/1.json
  def update
    @animal = Animal.find(params[:id])

    respond_to do |format|
      if @animal.update_attributes(params[:animal])
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url }
      format.json { head :no_content }
    end
  end
  
  def create_sequential_animal
    @animal = Animal.find(params[:id])
    new_animal = @animal.dup
    if new_animal.metal1.last(4) != "9999"
      new_animal.metal1 = metal_increment(new_animal.metal1)
    else
      new_animal.metal1 = nil
    end
    new_animal.old_tag = nil
    new_animal.age = nil
    new_animal.chv = nil
    new_animal.allflex = nil
    new_animal.bruc = nil
    new_animal.months_pregnant = nil
    new_animal.temperature = nil
    new_animal.comments = nil
    new_animal.sold = 0
    new_animal.sale_id = nil
    new_animal.save(:validate => false)
    redirect_to :action => :edit, :id => new_animal.id
  end

  def animal_assignment
    @animals_sold = params[:animals_sold]
    @sale_id = params[:sale_id]
    @animals_sold.each do |animal|
      a = Animal.find_by_id(animal)
      a.sale_id = @sale_id
      a.sold = 1
      a.save
    end
  redirect_to sale_path
  end

  def remove_animal_from_sale
    @animal = Animal.find(params[:animal])
    @animal.sold = 0
    @animal.sale_id = nil
    @animal.save
    redirect_to sale_path
  end

  def metal_increment(metal1)
    metal = metal1.first(5)
    n = Integer(metal1.last(4)) + 10000
    if n < 19999
      n += 1
      n = n.to_s.last(4)
      metal1 = metal + n
    else
      metal1 = nil
    end
  end
  
  private

  def sort_column
    Animal.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
