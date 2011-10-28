class PostItsController < ApplicationController
  # GET /post_its
  # GET /post_its.json
  def index
    @post_its = PostIt.order('updated_at DESC, id DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @post_its, :only => [:id, :username, :title, :updated_at] }
    end
  end
  
  # GET /post_its/last_updated
  def last_updated    
    render :json => PostIt.last_updated, :only => [:updated_at]
  end

  # GET /post_its/1
  # GET /post_its/1.json
  def show
    @post_it = PostIt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post_it }
    end
  end

  # GET /post_its/new
  # GET /post_its/new.json
  def new
    @post_it = PostIt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post_it }
    end
  end

  # GET /post_its/1/edit
  def edit
    @post_it = PostIt.find(params[:id])
    
    unless @post_it.allow_modification? params[:token]
      return redirect_to root_path, :alert => "Vous n'avez pas les droits pour modifier ce post-it"
    end
  end

  # POST /post_its
  # POST /post_its.json
  def create
    @post_it = PostIt.new(params[:post_it])

    respond_to do |format|
      if @post_it.save
        PersonMailer.new_post_it(@post_it).deliver
        format.html { redirect_to @post_it, :notice => 'Post it was successfully created.' }
        format.json { render :json => @post_it, :status => :created, :location => @post_it }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post_it.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_its/1
  # PUT /post_its/1.json
  def update
    @post_it = PostIt.find(params[:id])
    
    unless @post_it.allow_modification? params[:token]
      return redirect_to root_path, :alert => "Vous n'avez pas les droits pour modifier ce post-it"
    end
    
    respond_to do |format|
      if @post_it.update_attributes(params[:post_it])
        format.html { redirect_to @post_it, :notice => 'Post it was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post_it.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_its/1
  # DELETE /post_its/1.json
  def destroy
    @post_it = PostIt.find(params[:id])
    
    unless @post_it.allow_modification? params[:token]
      return redirect_to root_path, :alert => "Vous n'avez pas les droits pour supprimer ce post-it"
    end
    
    @post_it.destroy

    respond_to do |format|
      format.html { redirect_to post_its_url }
      format.json { head :ok }
    end
  end
end
