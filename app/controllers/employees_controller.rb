# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @company = Company.find_by(id: params[:company_id])
  end

  private

  def employee_params
    params.require(:employee)
  end
end
