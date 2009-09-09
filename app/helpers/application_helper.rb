# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def t_view(view,val)
    t(['views',params[:controller].gsub('/','.'),view, val].join('.'))    
  end

end

