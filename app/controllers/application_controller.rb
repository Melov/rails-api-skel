class ApplicationController < ActionController::API
  def requestData
    return JSON.parse(request.body.read)
  end

  def sendResponce(data = {}, message = "")
    @responce = { :status => 0, :message => message, :content => data }
    render :template => "layouts/data"
  end

  def throwError(errno, message)
    @responce = { :status => errno, :message => message }
    render :template => "layouts/data"
  end
end
