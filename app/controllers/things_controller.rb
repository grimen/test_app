class ThingsController < ApplicationController

  # GET /things
  def index
    @things = Thing.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /things/1
  def show
    @thing = Thing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /things/new
  def new
    @thing = Thing.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /things/1/edit
  def edit
    @thing = Thing.find(params[:id])
  end

  # POST /things
  def create
    @thing = Thing.new(params[:thing])

    respond_to do |format|
      if @thing.save
        flash[:notice] = 'Thing was successfully created.'
        format.html { redirect_to(@thing) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /things/1
  def update
    @thing = Thing.find(params[:id])

    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        flash[:notice] = 'Thing was successfully updated.'
        format.html { redirect_to(@thing) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /things/1
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to(things_url) }
    end
  end
end
