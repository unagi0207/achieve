class ContactsController < ApplicationController
    def new
    if params[:back]
     @contact = Contact.new(contacts_params)
     else
      @contact = Contact.new
     end
    end
   
    def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
    end
   
    def create
    @contact = Contact.new(contacts_params)
    if @contact.save
     redirect_to :root,notice:"お問合わせが完了しました"
    end   
    end
    
      private
    def contacts_params
      params.require(:contact).permit(:name, :mail,:content)
    end
end
    
