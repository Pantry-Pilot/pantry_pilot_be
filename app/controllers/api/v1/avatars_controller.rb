class Api::V1::AvatarsController < ApplicationController
  def create
    recipe = Recipe.find(params[:id])

    avatar = params[:avatar]

    require 'pry';binding.pry
    # require 'tempfile'
    # require 'action_dispatch/http/upload'
    
    # file_string = params[:avatar]
    
    # content_type = "image/png"
    # original_name = "roller_coaster.png"

    # tempfile = Tempfile.new
    # tempfile.binmode
    # tempfile.write(file_string)
    # tempfile.rewind

    # uploaded_file = ActionDispatch::Http::UploadedFile.new(
    # tempfile: tempfile,
    # type: content_type,
    # filename: original_name
    # )
    recipe.avatar.attach(avatar)
    
    if recipe.avatar.attached?
      render json: { notice: "Image uploaded succesfully", status: 200 }
    else
      render json: { error: recipe.errors.full_messages.to_sentence, status: 400 }
    end
  end
end