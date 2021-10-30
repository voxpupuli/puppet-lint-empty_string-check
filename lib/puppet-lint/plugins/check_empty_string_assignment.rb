PuppetLint.new_check(:empty_string_assignment) do
  def check
    class_indexes.concat(defined_type_indexes).each do |idx|
      params = extract_params(idx)
      params.each do |param|
        default_value = extract_default_value_tokens(param)
        type = extract_type_tokens(param)
        # why can those be empty?
        next if type.empty?
        next if default_value.empty?
        puts "first element is: #{type[0].type}"
        puts "default_value.value is: #{default_value[0].value.class}"
        # if the parameter has datatype String and a value of ''
        if type[0].type == :TYPE && type[0].value == 'String' && default_value[0].value == ''
          notify :warning, {
            :message => 'variable assigned to the empty string',
            :line    => param.line,
            :column  => param.column,
            #:token   => token,
          }
        end
      end
    end
  end

  def fix(problem)
    problem[:token].type = :UNDEF
    problem[:token].value = 'undef'
  end

  private

  # Returns an array of parameter tokens
  def extract_params(idx)
    params = []
    return params if idx[:param_tokens].nil?

    e = idx[:param_tokens].each
    begin
      while (ptok = e.next)
        next unless ptok.type == :VARIABLE

        params << ptok
        nesting = 0
        # skip to the next parameter to avoid finding default values of variables
        loop do
          ptok = e.next
          case ptok.type
          when :LPAREN, :LBRACK
            nesting += 1
          when :RPAREN, :RBRACK
            nesting -= 1
          when :COMMA
            break unless nesting.positive?
          end
        end
      end
    rescue StopIteration; end # rubocop:disable Lint/SuppressedException
    params
  end

  # Returns array of tokens that cover the value that the parameter token has as its default
  # Search forward to find value assigned to this parameter
  # We want to find the thing after `=` and before `,`
  def extract_default_value_tokens(ptok)
    value_tokens = []
    token = ptok.next_code_token
    nesting = 0
    while token
      case token.type
      when :LPAREN, :LBRACK
        nesting += 1
      when :RBRACK
        nesting -= 1
      when :RPAREN
        nesting -= 1
        if nesting.negative?
          # This is the RPAREN at the end of the parameters. There wasn't a COMMA
          last_token = token.prev_code_token
          break
        end
      when :EQUALS
        first_token = token.next_code_token
      when :COMMA
        unless nesting.positive?
          last_token = token.prev_code_token
          break
        end
      end
      token = token.next_token
    end
    value_tokens = tokens[tokens.find_index(first_token)..tokens.find_index(last_token)] if first_token && last_token
    value_tokens
  end

  # Returns an array of tokens that cover the data type of the parameter ptok
  # Search backwards until we either bump into a comma (whilst not nested), or reach the opening LPAREN
  def extract_type_tokens(ptok)
    type_tokens = []
    token = ptok.prev_code_token
    nesting = 0
    while token
      case token.type
      when :LBRACK
        nesting += 1
      when :LPAREN
        nesting += 1
        if nesting.positive?
          # This is the LPAREN at the start of the parameter list
          first_token = token.next_code_token
          last_token = ptok.prev_code_token
          break
        end
      when :RBRACK, :RPAREN
        nesting -= 1
      when :COMMA
        if nesting.zero?
          first_token = token.next_code_token
          last_token = ptok.prev_code_token
          break
        end
      end

      token = token.prev_code_token
    end
    type_tokens = tokens[tokens.find_index(first_token)..tokens.find_index(last_token)] if first_token && last_token
    type_tokens
  end
end
