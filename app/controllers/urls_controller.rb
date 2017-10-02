class UrlsController < ApplicationController

  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    url = Url.new(url_params)
    if url.save!
      url.update!(short_url: SecureRandom.base64(5).split("=").first)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @url = Url.find_by_short_url([params[:id]])
    redirect_to "http://" + @url.long_url
  end

  private
    def url_params
      params.require(:url).permit(:long_url)
    end

end



# def create
#   url = Url.new(url_params)
#   if url.save!
#     url.short_url = SecureRandom.base64(5).split("=").first
#     url.save!
#     redirect_to root_path
#   else
#     render :new
# end
