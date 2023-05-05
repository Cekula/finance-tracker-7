class Stock < ApplicationRecord

	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(
		  publishable_token: 'pk_1fdce3179c794932990e38e44f50f3f4',
		  secret_token: 'sk_61daaf67cdb8429da19ac9122f4f0a9b',
		  endpoint: 'https://cloud.iexapis.com/v1'
		)
	    client.price(ticker_symbol)
	end
end
