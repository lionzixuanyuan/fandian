class UserContactsController < ApplicationController
  # GET /user_contacts
  # GET /user_contacts.xml
  def index
    @user_contacts = UserContact.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_contacts }
    end
  end
  
  # GET /user_contacts/1
  # GET /user_contacts/1.xml
  def show
    @user_contact = UserContact.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_contact }
    end
  end
  
  # GET /user_contacts/new
  # GET /user_contacts/new.xml
  def new
    @user_contact = UserContact.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_contact }
    end
  end
  
  # GET /user_contacts/1/edit
  def edit
    @user_contact = UserContact.find(params[:id])
  end
  
  # POST /user_contacts
  # POST /user_contacts.xml
  def create
    @user_contact = UserContact.new(params[:user_contact])
    
    respond_to do |format|
      if @user_contact.save
        format.html { redirect_to(@user_contact, :notice => 'UserContact was successfully created.') }
        format.xml  { render :xml => @user_contact, :status => :created, :location => @user_contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_contact.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /user_contacts/1
  # PUT /user_contacts/1.xml
  def update
    @user_contact = UserContact.find(params[:id])
    
    respond_to do |format|
      if @user_contact.update_attributes(params[:user_contact])
        format.html { redirect_to(@user_contact, :notice => 'UserContact was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_contact.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /user_contacts/1
  # DELETE /user_contacts/1.xml
  def destroy
    @user_contact = UserContact.find(params[:id])
    @user_contact.destroy
    
    respond_to do |format|
      format.html { redirect_to(user_contacts_url) }
      format.xml  { head :ok }
    end
  end
  
  #检查地址和电话是否已被注册，如果是，返回空值，否则注册并返回一个随机数作为用户ID
  def CheckContactInfo
    #    user_contact = UserContact.find(:last,:conditions => ["addr = :addr and phone = :phone",{:addr => params[:addr], :phone => params[:phone]}])
    #    if user_contact
    #      value = nil
    #    else
    #      #9位以9开头的随机数
    #      random_number = 900000000 + rand(99999999)
    #      new_uc = UserContact.create(:user_id => random_number, :addr => params[:addr], :phone => params[:phone], :is_default => true)
    #      value = random_number
    #    end
    #修改为生成用户随机ID并记录联系方式
    random_number = 900000000 + rand(99999999)
    new_uc = UserContact.create(:user_id => random_number, :addr => params[:addr], :phone => params[:phone], :is_default => true)
    value = random_number
    render :text => value
  end
end
