require 'flying_saucer'
class AgendasController < ApplicationController
  before_filter :logged_in?
  before_filter :current_users_settings

  
  
  def index
    if params[:search]
      @agendas = AgendaItem.search(params[:search]).collect {|x| x.agenda if x.agenda.user == current_user}.compact
    else
      @agendas = current_user.agendas
    end
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
        FlyingSaucer.make_pdf( File.new("/tmp/#{current_user.username}.#{@agenda.date}.html") , :output => new_pdf)
        send_file(new_pdf.path)
        new_pdf.close
      }
    end
    
  end
  
  def new
    @agenda = current_user.agendas.new
  end
  
  def create
    @agenda = current_user.agendas.new(params[:agenda])
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
