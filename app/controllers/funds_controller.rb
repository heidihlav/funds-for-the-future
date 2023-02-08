class FundsController < ApplicationController

  # GET: /funds
  get "/funds" do
    @funds = Fund.all
    erb :"/funds/index.html"
  end

  # GET: /funds/new
  get "/funds/new" do
    erb :"/funds/new.html"
  end

  # POST: /funds
  post "/funds" do
    redirect "/funds"
  end

  # GET: /funds/5
  get "/funds/:id" do
    erb :"/funds/show.html"
  end

  # GET: /funds/5/edit
  get "/funds/:id/edit" do
    erb :"/funds/edit.html"
  end

  # PATCH: /funds/5
  patch "/funds/:id" do
    redirect "/funds/:id"
  end

  # DELETE: /funds/5/delete
  delete "/funds/:id/delete" do
    redirect "/funds"
  end
end
