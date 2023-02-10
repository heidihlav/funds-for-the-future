require 'pry'

class FundsController < ApplicationController

  # GET: /funds
  get "/funds" do
    @funds = Fund.all
    erb :"/funds/index.html"
  end


  # POST: /funds
  post "/funds" do
    redirect "/login" if not logged_in?
    @fund = current_user.funds.build(name: params[:fund][:name], balance: params[:fund][:balance], age: params[:fund][:age])
    if @post.save
      redirect "/funds"
    else
      erb :"/funds/new.html"
    end
  end


  # GET: /funds/new
  get "/funds/new" do
    redirect "/login" if not logged_in?
    @fund = Fund.new
    erb :"/funds/new.html"
  end


  # GET: /funds/5
  get "/funds/:id" do
    set_post
    # @fund = Fund.find(params[:id])
    erb :"/funds/show.html"
  end

  # GET: /funds/5/edit
  get "/funds/:id/edit" do
    set_post
    erb :"/funds/edit.html"
  end

  # PATCH: /funds/5
  patch "/funds/:id" do
    set_post
    if @fund.update(name: params[:fund][:name], balance: params[:fund][:balance], age: params[:fund][:age])
      flash[:success] = "Update successful."
      redirect "/funds/#{@fund.id}"
    else 
      erb:"/funds/edit.html"
    end
  end

  # DELETE: /funds/5/delete
  delete "/funds/:id" do
    set_post
    @fund.destroy
    redirect "/funds"
  end
end

private

  def set_post
    @fund = Fund.find_by_id(params[:id])
    if @fund.nil?
      flash[:error] = "Fund does not exist."
      redirect "/posts"
    end
  end