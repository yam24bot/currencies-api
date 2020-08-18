class CurrencyController < ApplicationController
  before_action :api_request, except: [:show]

  def calculate
    #localhost:3000/calculate?first_currency=USD&second_currency=UAH&first_currency_value=10

    result = (params['first_currency_value'].to_f / @all_rates[params['first_currency']]) * @all_rates[params['second_currency']]
    render json: result
  end

  def show
    # localhost:3000/show?date_from=2013-12-12&date_to=2020-12-12

    result = Currency.where("created_at > '#{params['date_from']}' and created_at < '#{params['date_to']}'")
    render json: result
  end

  def create
    Currency.create(rates: @all_rates)
  end

  private

  def api_request
    if date.nil?
      date = latest
    else
      date = params['date']
    end
    url = "http://data.fixer.io/api/#{date}?access_key=#{ENV['api_key']}"
    response = RestClient.get(url)
    @hash = JSON.parse(response)
    @all_rates = @hash['rates']
  end

end