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
    @agenda_item = AgendaItem.new
  end
  
  def create
    @agenda_item = AgendaItem.new(params[:agenda_item])
    @agenda_item.agenda = Agenda.find(params[:agenda_id])
    @agenda_item.date = @agenda_item.agenda.date
    if @agenda_item.save
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
    if @agenda_item.update_attributes(params[:agenda_item])
      flash[:notice] = "Successfully updated agendaitem."
      redirect_to @agenda
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @agenda_item = AgendaItem.find(params[:id])
    @agenda_item.destroy
    flash[:notice] = "Successfully destroyed agendaitem."
    redirect_to @agenda
  end
  
  private
  def load_agenda
    @agenda = Agenda.find(params[:agenda_id])
  end
end
