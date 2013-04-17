#encoding : utf-8
require 'digest/sha1'
class CodesController < ApplicationController
  layout 'code'
  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all

  end

  def save
    if  Code.create(title: params[:title],code: params[:code],user_id: session[:user].id)
      render json: "恭喜你保存代码成功"
    else
      render json: "保存代码失败"
    end
  end

  def realtime
    url = Digest::SHA1.hexdigest(params[:invitationcode])
    session[:username] = params[:username]
    session[:invitationcode] = params[:invitationcode]
    redirect_to new_code_path(token: url)

  end

  # GET /codes/1
  # GET /codes/1.json
  def show
    @code = Code.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @code }
    end
  end

  # GET /codes/new
  # GET /codes/new.json
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit
    @code = Code.find(params[:id])
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = Code.new(params[:code])
    render json: params
  end

  # PUT /codes/1
  # PUT /codes/1.json
  def update
    @code = Code.find(params[:id])

    respond_to do |format|
      if @code.update_attributes(params[:code])
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    @code = Code.find(params[:id])
    @code.destroy

    respond_to do |format|
      format.html { redirect_to codes_url }
      format.json { head :no_content }
    end
  end
end
