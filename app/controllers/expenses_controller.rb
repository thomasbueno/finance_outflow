class ExpensesController < ApplicationController
  def create
    @expense = Expense.new
    @expense.attributes = expense_params

    @expense.save!

    render :show
  rescue
    render json: {}, status: 406
  end

  private

  def expense_params
    return {} unless params.has_key?(:expense)
    params.require(:expense).permit(:id, :description, :category, :value, :date)
  end

end
