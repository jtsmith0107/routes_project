class ContactSharesController < ApplicationController
  include ContactSharesHelper
  
  def index
    render :json => ContactShare.all
  end
  
  def create
    @contact_share = ContactShare.new(contact_shares_params)

    if @contact_share.save
      render :json => @contact_share
    else
      render :json => @contact_share.errors.full_messages, :status => :unprocessable_entity
    end
  end
  
  def show
    render :json => ContactShare.find(params[:id])
  end
  
  def update
    @contact_share = ContactShare.find(params[:id])
    if @contact_share.update(contact_shares_params)
      render :json => @contact_share
    else
      render :json => @contact_share.errors.full_messages, :status => :unprocessable_entity
    end
  end
  
  def destroy
    @contact_share = ContactShare.find(params[:id])
    @contact_share.destroy!
    
    render :json => @contact_share
  end
  
  def favorite
    @contact_share = ContactShare.find(params[:id])
    if @contact_share.update(@contact_share.favorite ? {favorite: false} : {favorite: true})
      render :json => @contact_share
    else
      render :json => @contact_share.errors.full_messages, :status => :unprocessable_entity
    end
  end
end
