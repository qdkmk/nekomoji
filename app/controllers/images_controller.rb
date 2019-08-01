class ImagesController < ApplicationController
  def ogp
    text = ogp_params[:text]
    image = OgpCreator.build(text).tempfile.open.read
    #send_data image, :type => 'image/png',:disposition => 'inline'
    #send_data(image.to_blob, :type => 'image/png',:disposition => 'inline')
    @image = image.to_blob
  end

  def index
  end

  def ogp_params
    params.permit(:text)
  end
end
