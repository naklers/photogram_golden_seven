class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @id = params["id"]
    @photo = Photo.find(@id)
  end

  def new_form
  end

  def create
    @photo = Photo.new
    @photo.source = params["the_source"]
    @photo.caption = params["the_caption"]
    @photo.save
    redirect_to("http://localhost:3000/photos")
  end

  def delete
    @photo = Photo.find(params["id"])
    @photo.destroy
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @photo = Photo.find(params["id"])
  end

  def update_row
    @photo = Photo.find(params["id"])
    @photo.caption = params["the_caption"]
    @photo.source = params["the_source"]
    @photo.save
    redirect_to("http://localhost:3000/photos/#{@photo.id}")
  end

end
