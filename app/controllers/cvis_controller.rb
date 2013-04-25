class CvisController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  # GET /cvis
  # GET /cvis.json
  def index
    @cvis = Cvi.all(:order => "cvi_number DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cvis }
    end
  end

  # GET /cvis/1
  # GET /cvis/1.json
  def show
    @cvi = Cvi.find(params[:id])
    @animals = @cvi.animals

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cvi }
    end
  end

  # GET /cvis/new
  # GET /cvis/new.json
  def new
    @cvi = Cvi.new
    @cvi.sale_id = params[:sale_id]
    @people = Person.all(:order => :lastname)
    @cvi.cvi_number = @cvi.newCviNumber
    person_id = @cvi.person_id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cvi }
    end
  end

  # GET /cvis/1/edit
  def edit
    @cvi = Cvi.find(params[:id])
    @people = Person.all(:order => :lastname)
  end

  # POST /cvis
  # POST /cvis.json
  def create
    @cvi = Cvi.new(params[:cvi])
    @people = Person.all

    respond_to do |format|
      if @cvi.save
        format.html { redirect_to @cvi, notice: 'Cvi was successfully created.' }
        format.json { render json: @cvi, status: :created, location: @cvi }
      else
        format.html { render action: "new" }
        format.json { render json: @cvi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cvis/1
  # PUT /cvis/1.json
  def update
    @cvi = Cvi.find(params[:id])
    @people = Person.all

    respond_to do |format|
      if @cvi.update_attributes(params[:cvi])
        format.html { redirect_to @cvi, notice: 'Cvi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cvi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cvis/1
  # DELETE /cvis/1.json
  def destroy
    @cvi = Cvi.find(params[:id])
    @cvi.destroy

    respond_to do |format|
      format.html { redirect_to cvis_url }
      format.json { head :no_content }
    end
  end
end
