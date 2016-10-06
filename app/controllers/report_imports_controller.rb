class ReportImportsController < ApplicationController
  # http_basic_authenticate_with name: 'ipadmini', password: 'miniipad'
  def create
    SalesReport.import(params[:file])
    redirect_to root_url, notice: 'Raport zaimportowany!.'
  end
end
