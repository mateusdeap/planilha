class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    transaction = Transaction.new(transaction_params)

    if transaction.save
      flash[:success] = "Expense added!"
      redirect_to transactions_path
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :date)
  end
end
