module ContactsHelper
  private
  def contacts_params
    params.require(:contact).permit(:user_id, :name, :email)
  end
end
