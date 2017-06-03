# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by!(id: params[:id])
  end

  def edit
    @company = Company.find_by!(id: params[:id])
  end

  def update
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.owner = current_user
    @company.save!

    redirect_to companies_path
  end

  def delete
  end

  private

  def company_params
    params.require(:company).permit(:name, :city, :info)
  end
end
