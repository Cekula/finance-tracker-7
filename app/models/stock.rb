class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    validates :ticker, presence: true
    
	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(
		  publishable_token: 'pk_1fdce3179c794932990e38e44f50f3f4',
		  secret_token: 'sk_61daaf67cdb8429da19ac9122f4f0a9b',
		  endpoint: 'https://cloud.iexapis.com/v1'
		)
		begin
	     new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
	    rescue => exeption
	    	return nil
	    end 
	end
end
