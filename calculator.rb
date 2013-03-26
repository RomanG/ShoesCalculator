Shoes.app :title => "Thy Calculator", :width => 200, :height => 210, :resizable => false :color => blue do
  stack :margin => 20 do
    @output = edit_line :width => 150, :margin_bottom => 10
    
    flow do
      %w(7 8 9 / 4 5 6 * 1 2 3 - 0 +).each do |op|      
        button op do         
          append op
        end
      end
      
      button "=" do
        eval_expression
      end

      button "C" do
        clear_all
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
  end
  
end
