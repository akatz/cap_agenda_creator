require 'flying_saucer/itext_renderer'
class AgendasController < ApplicationController
  before_filter :logged_in?
  before_filter :current_users_settings
  
  Mime::Type.register "text/pdf", :pdf
  def index
    @agendas = current_user.agendas
  end
  
  def show
    @agenda = Agenda.find(params[:id])
    @agenda_items = @agenda.agenda_items
    
    respond_to do |format|
      format.html
      format.pdf { 
        File.open("/tmp/#{current_user.username}.#{@agenda.date}.html", "w") do |f| 
          f.write(render_to_string(:layout => true, :layout => "pdf"))
        end
        new_pdf = File.open("/tmp/#{@agenda.date}.pdf", "w")
        ITextRenderer.new.make_pdf( "/tmp/#{current_user.username}.#{@agenda.date}.html" , new_pdf)
        send_file(new_pdf.path)
      }
    end
    
  end
  
  def new
    @agenda = Agenda.new
  end
  
  def create
    @agenda = Agenda.new(params[:agenda])
    if @agenda.save
      flash[:notice] = "Successfully created agenda."
      redirect_to @agenda
    else
      render :action => 'new'
    end
  end
  
  def edit
    @agenda = Agenda.find(params[:id])
  end
  
  def update
    @agenda = Agenda.find(params[:id])
    if @agenda.update_attributes(params[:agenda])
      flash[:notice] = "Successfully updated agenda."
      redirect_to @agenda
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @agenda = Agenda.find(params[:id])
    @agenda.destroy
    flash[:notice] = "Successfully destroyed agenda."
    redirect_to agendas_url
  end
  
end
