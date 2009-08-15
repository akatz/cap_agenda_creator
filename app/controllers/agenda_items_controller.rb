class AgendaItemsController < ApplicationController
  before_filter :load_agenda
  def index
    # @agenda_items = AgendaItem.all
    @agenda_items = @agenda.agenda_items
  end
  
  def show
    @agenda_item = AgendaItem.find(params[:id])
  end
  
  def new
    @agenda_item = @agenda.agenda_items.new()
  end
  
  def create
    
    # params[:agenda_item][:agenda] = @agenda  unless params[:agenda_item].blank?
    @agenda_item = @agenda.agenda_items.create(params[:agenda_item]) rescue AgendaItem.new(params[:agenda_item])
    
    if @agenda_item.valid? and not @agenda_item.new_record?
      flash[:notice] = "Successfully created agendaitem."
      redirect_to @agenda
    else
      render :action => 'new'
    end
    
    
    
  end
  
  def edit
    @agenda_item = AgendaItem.find(params[:id])
  end
  
  def update
    @agenda_item = AgendaItem.find(params[:id])
    @agenda_item.agenda = Agenda.find(params[:agenda_id])
    @agenda_item.date = @agenda_item.agenda.date
    @agenda_item.activity_name = params[:agenda_item][:activity_name]
    @agenda_item.oic = params[:agenda_item][:oic]
    @agenda_item.start_time = (@agenda_item.date.to_s + " " + (Chronic.parse(  params[:agenda_item][:start_time])).strftime('%H:%M:%S')).to_time
    @agenda_item.end_time =   (@agenda_item.date.to_s + " " + (Chronic.parse( params[:agenda_item][:end_time])).strftime('%H:%M:%S')).to_time
    
    if @agenda_item.save
      flash[:notice] = "Successfully updated agenda item."
      redirect_to @agenda
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @agenda_item = AgendaItem.find(params[:id])
    @agenda_item.destroy
    flash[:notice] = "Successfully destroyed agendaitem."
    redirect_to agenda_agenda_items_path(@agenda)
  end
  
  private
  def load_agenda
    @agenda = Agenda.find(params[:agenda_id])
  end
end
