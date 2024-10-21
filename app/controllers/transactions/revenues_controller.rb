class Transactions::RevenuesController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    transaction = Transaction.new(transaction_params)

    if transaction.save
      flash[:success] = "Revenue added!"
      redirect_to transactions_path
    else
      render :new
    end
  end

  private

  def transaction_params
    debugger
    params.require(:transaction).permit(:amount, :date)
  end
end
