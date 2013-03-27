Shoes.app :title => "Thy Calculator", :width => 200, :height => 260, :resizable => false  do background "#EBFFFF"
  stack :margin => 20 do
    @output = edit_line :width => 150, :height => 55, :margin_bottom => 10

    flow do
      %w(7 8 9 / 4 5 6 * 1 2 3 - 0 +).each do |op|     
        button op do         
          append op
        end
      end
      
      button "C" do
        clear_all
      end

      button "=" do
        eval_expression
      end
      
      button "^" do
        append "**"
      end
      
      button "sqrt", :width => 72 do
        append " = #{Math.sqrt(@input.to_i)}"
      end

      button "^2" do
        append " * #{@input.to_i}"
      end
    end
  end
  # Stick a string on the end of our input
  #
  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end

  def clear_all
    @input = ""
    @output.text = @input

    def square
      @input = @input.to_i * @input.to_i
    end

    def square_root
      @input = Math.sqrt(@input.to_i)
    end

    def power
      @input = @input**@input
    end
  end
end