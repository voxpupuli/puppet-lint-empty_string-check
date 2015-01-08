PuppetLint.new_check(:empty_string_parameter_assignment) do
  def check
    tokens.each_with_index do |token, token_idx|
      if token.type == :SSTRING && token.prev_code_token.type == :EQUALS && \
         token.value == ''

        notify :warning, {
          :message => 'variable assigned to the empty string',
          :line    => token.line,
          :column  => token.column,
          :token   => token,
        }
      end
    end
  end

  def fix(problem)
    problem[:token].type = :UNDEF
    problem[:token].value = 'undef'
  end
end
