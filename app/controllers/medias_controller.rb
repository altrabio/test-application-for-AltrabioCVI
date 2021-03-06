class MediasController < ApplicationController
  
  #use for initialization to fake a real mediaion environment
  def initPEJ
    a=Media.new
    a=Book.new
    a=Audio.new
    a=Mp3.new
    a=Video.new
    a=Dictionary.new
    a=PocketDictionary.new
    a=Unknown.new    
  end
  
  # GET /medias
  # GET /medias.xml
  def index
    @medias = Media.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medias }
    end
  end

  # GET /medias/1
  # GET /medias/1.xml
  
  def show
    @media = Media.find(params[:id])
    @assoc = Media.reflect_on_all_associations
    @TabAssoc=[]
    @assoc.each do |a|
      @TabAssoc<<a.klass;
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /medias/new
  # GET /medias/new.xml
  def new
    @media = Media.new
    @item=@media

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /medias/1/edit
  def edit
    @media = Media.find(params[:id])
  end

  # POST /medias
  # POST /medias.xml
  def create
    @media = Media.new(params[:media])

    respond_to do |format|
      if @media.save
        format.html { redirect_to(@media, :notice => 'Media was successfully created.') }
        format.xml  { render :xml => @media, :status => :created, :location => @media }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medias/1
  # PUT /medias/1.xml
  def update
    @media = Media.find(params[:id])

    respond_to do |format|
      if @media.update_attributes(params[:media])
        format.html { redirect_to(@media, :notice => 'Media was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medias/1
  # DELETE /medias/1.xml
  def destroy
    @media = Media.find(params[:id])
    @media.destroy

    respond_to do |format|
      format.html { redirect_to(medias_url) }
      format.xml  { head :ok }
    end
  end
  def populate
    Media.testPopulate
    @medias = Media.all
    
    render :index
  end 
  def delete_all
    Media.destroy_all
    @medias = Media.all
    
    render :index
  end
end
