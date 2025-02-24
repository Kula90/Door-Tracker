class ServiceWorkerController < ApplicationController
  protect_from_forgery except: :index

  def index
    response.headers['Content-Type'] = 'application/javascript'
  end
end
