class RpgController < ApplicationController
  def index
    session[:total] ||= 0
    session[:action] ||= []
    render 'index'
  end

  def gold
    this_gold = 0
    date = Time.now.strftime("%Y/%m/%d %-I:%M%p")

      if params[:building_type] == 'farm'
        this_gold = rand(10..20)
        session[:total] += this_gold
        session[:action].unshift("Earned #{ this_gold } golds from the farm! #{ date }")

      elsif params[:building_type] == 'cave'
        this_gold = rand(5..10)
        session[:total] += this_gold
        session[:action].unshift("Earned #{ this_gold } golds from the cave! #{ date }")

      elsif params[:building_type] == 'house'
        this_gold = rand(2..5)
        session[:total] += this_gold
        session[:action].unshift("Earned #{ this_gold } golds from the house! #{ date }")

      else
        this_gold = rand(-50..50)
        session[:total] += this_gold
          if this_gold < 0
            session[:action].unshift("Entered a casino and lost #{ this_gold } golds! OUCH!!! #{ date }")
          else
            session[:action].unshift("Entered a casino and Earned #{ this_gold } golds! CONGRATS!!! #{ date }")
          end
      end

    redirect_to('/')
  end

  def reset
    session.clear
    redirect_to('/')
  end
end