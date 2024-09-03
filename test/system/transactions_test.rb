require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit transactions_url

    assert_selector "h1", text: "Transactions"
  end

  test "adding an expense transaction" do
    visit transactions_url

    click_on "Add Expense"

    fill_in "Amount", with: "823782"
    fill_in "Date", with: DateTime.now

    click_on "Save"

    assert_text "Expense added!"

    created_transaction = Transaction.last
    assert_text created_transaction.amount
  end

  test "adding a revenue transaction" do
    visit transactions_url

    click_on "Add Revenue"

    fill_in "Amount", with: "20000"
    fill_in "Date", with: DateTime.now

    click_on "Save"

    assert_text "Revenue added!"

    created_transaction = Transaction.last
    assert_text created_transaction.amount
  end
end
