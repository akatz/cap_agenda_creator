require 'test_helper'

class AgendaItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => AgendaItem.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    AgendaItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    AgendaItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to agenda_agenda_item_url(assigns(:agenda_item))
  end
  
  def test_edit
    get :edit, :id => AgendaItem.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    AgendaItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AgendaItem.first
    assert_template 'edit'
  end
  
  def test_update_valid
    AgendaItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AgendaItem.first
    assert_redirected_to agenda_agenda_item_url(assigns(:agenda_item))
  end
  
  def test_destroy
    agenda_item = AgendaItem.first
    delete :destroy, :id => agenda_item
    assert_redirected_to agenda_items_url
    assert !AgendaItem.exists?(agenda_item.id)
  end
end
