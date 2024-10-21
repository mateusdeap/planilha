require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    expenses = Transaction.expenses
    revenues = Transaction.revenues

    assert_selector "h1", text: "Transactions"
    assert_selector "h2", text: "Total Revenue"
    assert_selector "h2", text: "Total Expenses: "
  end

  test "adding an expense transaction" do
    visit root_url

    click_on "Add Expense"

    fill_in "Amount", with: "823782"
    fill_in "Date", with: DateTime.now

    click_on "Save"

    assert_text "Expense added!"

    created_transaction = Transaction.last
    assert_text created_transaction.amount
  end

  test "adding a revenue transaction" do
    visit root_url

    click_on "Add Revenue"

    fill_in "Amount", with: "20000"
    fill_in "Date", with: DateTime.now

    click_on "Save"

    assert_text "Revenue added!"

    created_transaction = Transaction.last
    assert_text created_transaction.amount
  end
end
