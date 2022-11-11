class CalculatesController < ApplicationController
  def index
  end

  def calculate
    _cal_log = CalculatorLog.new
    _the_operand = calculate_params[:operand]
    _theText = ""
    _theResult = 0
    _theID = ""

    begin
      case _the_operand
      when "sum"
        _the_operand = "+"
      when "mul"
        _the_operand = "*"
      when "div"
        _the_operand = "/"
      when "dif"
        _the_operand = "-"
      end

      
      _theText= "#{calculate_params[:field_one]}#{_the_operand}#{calculate_params[:field_two]}"
      _counter = CalculatorLog.where(operation: _theText).count()

      if _counter == 0
        _theReText= "#{calculate_params[:field_two]}#{_the_operand}#{calculate_params[:field_one]}"
        _counter = CalculatorLog.where(operation: _theReText).count()

        if _counter == 0
          # insert into table
          _theResult = eval(_theText)
          _thedata = CalculatorLog.create(operation: _theText, results: _theResult )
          _theID = "#{_thedata._id }"
        else
          _thedata = CalculatorLog.where(operation: _theReText)[0]
          _theResult = _thedata.results
          _theID = "#{_thedata._id }"
        end
      else  #exists
        _thedata = CalculatorLog.where(operation: _theText)[0]
        _theResult = _thedata.results
        _theID = "#{_thedata._id }"
      end
 
      theResult = {
        "theOperation" => _theText,
        "theResult" => _theResult,
        "theId" => _theID,
        "PreviousCalls" => _counter,
        "ErrorCode" => "200",
        "ErrorDEsc" => ""
      }

      render json: theResult, status: :ok

    rescue => exception
      theResult = {
        "theOperation" => _theText,
        "theResult" => _theResult,
        "theId" => _theID,
        "PreviousCalls" => _counter,
        "ErrorCode" => "101",
        "ErrorDEsc" => exception.message
      }

      render json: theResult, status: :ok

    end
  end

  
  protected
    def calculate_params
      params.permit(:field_one,:field_two,:operand)
    end
end
