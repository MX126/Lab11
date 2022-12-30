# frozen_string_literal: true

# главный реализующий класс
class PalmsController < ApplicationController
  def input
    params[:v1]
  end

  def view
    @mas = do_res
    @def = add_to_db
    #ActiveSupport::JSON::decode(res)
    render xml: do_res
  end

  private

  def valid(value)
    if value.nil?
      'UNKNOWN'
    elsif value.split(//).to_a.length != value.gsub(/\s+/, '').to_i.to_s.length
      'UNKNOWN'
    else
      'VALID'
    end
  end

  def do_palm(first_val)
    if first_val != first_val.reverse
      first_val.to_i + first_val.reverse.to_i
    else
      'Значение является палиндромом'
    end
  end

  def check_palm(val)
    if do_palm(val).to_s.to_i != 0
      do_palm(val).to_s
    else
      do_palm(val)
    end
  end

  def do_res
    val = input
    res = []
    if valid(val) != 'UNKNOWN'
      i = 0
      loop do
        res[i] = if do_palm(val) == 'Значение является палиндромом'
                   [i + 1, val, 'Палиндром']
                 else
                   res[i] = [i + 1, val, 'Не Палиндром']
                 end
        break if do_palm(val) == 'Значение является палиндромом'

        i += 1
        val = check_palm(val)
      end
    else
      res[0] = [1, 'Unknown', 'Unknown']
    end
    res
  end

  def add_to_db
    palm = Value.find_by(input: params[:v1])
    if palm == nil
      palm = Value.new(input: params[:v1], output: @mas[@mas.length - 1][1] )
      palm.save
      'Added'
    else
      'No added'
    end
  end

  def db_to_xml
    object = Value.last
    render xml: object
  end
end

