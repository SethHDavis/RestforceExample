#contact controller
class ContactsController < ApplicationController
  #POST
  def new
    @contact = Contact.new
  end

  #POST
  def create
    @contact = Contact.new(contact_params)
    @salesforce = client.create('Contact', Name: name)
  end

  #GET
  def index
    @contacts = client.query("SELECT ALL FROM Contact")
  end

  #GET
  def show
    @contact = Contact.find(params[:id])
  end

  #PATCH
  def update
    @user = Contact.find(params[:id])
    client.update('Contact', Id: @salesforce, Name: name)
  end

  #DELETE
  def destroy
    Contact.find(params[:id]).destroy
    client.destroy('Contact', @salesforce)
  end

  private

  def contact_params
    params.require(:contact).permit(:name)
  end
