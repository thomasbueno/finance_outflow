class ExpensesController < ApplicationController
  def create
    @expense = Expense.new
    @expense.attributes = expense_params

    @expense.save!

    render json: {"status": "200", "message": "Expense created with success!"}
  end

  private

  def expense_params
    return {} unless params.has_key?(:expense)
    params.require(:expense).permit(:id, :description, :category, :value, :date)
  end

end
