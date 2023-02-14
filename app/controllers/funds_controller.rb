require 'pry'

class FundsController < ApplicationController

  # GET: /funds
  get "/funds" do
    @funds = current_user.funds.all
    erb :"/funds/index.html"
  end

  # GET: /funds/new
  get "/funds/new" do
    redirect "/login" if not logged_in?
    @fund = Fund.new
    erb :"/funds/new.html"
  end

  # POST: /funds
  post "/funds" do
    redirect "/login" if not logged_in?
    @fund = current_user.funds.build(name: params[:fund][:name], balance: params[:fund][:balance], age: params[:fund][:age])
    if @fund.save
      redirect "/funds"
    else
      erb :"/funds/new.html"
    end
  end

  # GET: /funds/5
  get "/funds/:id" do
    @fund = Fund.find(params[:id])
    set_post
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
    redirect "/funds/:id"
  end

  # DELETE: /funds/5/delete
  delete "/funds/:id/delete" do
    set_post
    redirect "/funds"
  end
end

private

def set_post
  @fund = Fund.find_by_id(params[:id])
    if @fund.nil?
      flash[:error] = "Fund does not exist."
      redirect "/funds"
    end
  end