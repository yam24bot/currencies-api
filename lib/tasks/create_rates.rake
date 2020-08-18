
desc 'Create new object of rates'
  task :create_currency => :environment do
    url = "http://data.fixer.io/api/latest?access_key=#{ENV['api_key']}"
    response = RestClient.get(url)
    rates = JSON.parse(response)['rates']
    Currency.create(rates: rates)
  end
