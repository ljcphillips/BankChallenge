# require_relative './bank_account.rb'
# require_relative './statement.rb'
#
# class Interface
#   attr_accessor :bank_accounts, :statement, :selected_account
#
#   def initialize
#     @bank_accounts = []
#   end
# # key word arguments
#   def new_account(args) # new and save account?
#     @bank_accounts << AccountInfo.create_with(args)
#     # @bank_accounts << { "reference" => args[:reference],
#     #                     "bank_account" => args.fetch(:bank_account, BankAccount.new),
#     #                     "statement" => args.fetch(:statement, Statement.new) }
#   end
#
#   def select_account(reference)
#     @selected_account = @bank_accounts.select { |bank_account| bank_account["reference"] == reference }[0]["bank_account"]
#     @statement = @bank_accounts.select { |bank_account| bank_account["reference"] == reference }[0]["statement"]
#   end
#
# end
