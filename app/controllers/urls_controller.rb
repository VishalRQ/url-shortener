class UrlsController < ApplicationController
  before_action :retrieve_urls


  def index
    retrieve_urls
    @shortcode_stats = ShortcodeViewer.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url, notice: "Short URL created successfully."
    else
      flash.now[:alert] = "Invalid URL"
      render :new
    end
  end

  def show
    @url = Url.find_by!(short_code: params[:short_code])
  end

  def redirect
  @url = Url.find_by!(short_code: params[:short_code])

  @url.click_records.create(
    ip: request.remote_ip,
    user_agent: request.user_agent
  )

  redirect_to @url.original_url, allow_other_host: true
  end



  private

  def retrieve_urls
    @urls = Url.all
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
