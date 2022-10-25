class ExpensesController < ApplicationController
  before_action :load_expense, only: [:update, :destroy]

  def index
    filtered_expenses = Expense.where(date: params[:start_date]..params[:end_date])

    render json: filtered_expenses
  end

  def create
    @expense = Expense.new
    @expense.attributes = expense_params

    @expense.save!

    render json: {"status": "200", "message": "Expense created with success!"}
  end

  def update
    binding.pry
    @expense.attributes = expense_params

    @expense.save!

    render json: {"status": "200", "message": "Expense updated with success!"} 
  end

  def destroy
    @expense.destroy!

    render json: {"status": "200", "message": "Expense deleted with success!"}
  end

  private

  def load_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    return {} unless params.has_key?(:expense)
    params.require(:expense).permit(:id, :description, :category, :value, :date)
  end

end
