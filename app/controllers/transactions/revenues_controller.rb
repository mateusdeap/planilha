class Transactions::RevenuesController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    transaction = Transaction.new(transaction_params)

    if transaction.save
      flash[:success] = "Revenue added!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :date).merge({ kind: 1 })
  end
end
