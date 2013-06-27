class ChartsController < ApplicationController
  def index
    @charts = Chart.all
    @chart = Chart.new
  end

  def mixpanel_api
    config = {api_key: '8800d49f770e5bcf8e0e29b7c0df86ba', api_secret: '109995be65693b4a22286f2cf7045392'}
    client = Mixpanel::Client.new(config)

    data = client.request('events/properties', {
      event:     'Landing Page Loaded',
      name:      'Landing Page Loaded',
      type:      'general',
      unit:      'day',
      interval:   7,
      })
    render :json => data
  end

end
