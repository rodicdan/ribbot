class ThemesController < ApplicationController
  before_filter :require_current_forum!
  
  def show
    @theme = Theme.find(params[:id])
    render :nothing => true and return if @theme.blank?
    
    if stale?(:etag => @theme, :last_modified => @theme.updated_at)
      render 'themes/show.html.erb', :layout => false, :content_type => "text/css"
    end
  end
end
