class PostsController < ApplicationController

  # GET /posts
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.build_thing
    template_format = params[:format] || 'erb'
    #firebug.debug 'Check 1-2-1'
    # I18n.locale = 'sv'
    respond_to do |format|
      format.all { render "new.html.#{template_format}", :content_type => "text/html", :layout => 'application.html' }
      #format.haml { render "new.html.#{template_format}" }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @post.build_thing unless @post.thing.present?
    template_format = params[:format] || 'erb'
    
    respond_to do |format|
      format.all { render "edit.html.#{template_format}", :content_type => "text/html", :layout => 'application.html' }
    end
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
    @post.build_thing unless @post.thing.present?
    template_format = params[:format] || 'erb'
    
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
      else
        format.all { render "new.html.#{template_format}", :content_type => "text/html", :layout => 'application.html' }
      end
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
      else
        format.all { render "edit.html.#{template_format}", :content_type => "text/html", :layout => 'application.html' }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
    end
  end
end
