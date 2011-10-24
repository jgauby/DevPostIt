Fabricator(:language) do
  name         { Fabricate.sequence(:language_name) { |i| "Language-#{i+1}" } }
  identifiers  { { 
    'keywords' => {
      '#F00' => 'abstract|and|array|as|break|case|catch|cfunction|class|clone|const|continue|declare|default|do|else|elseif|enddeclare|endfor|endforeach|endif|endswitch|endwhile|extends|final|for|foreach|function|global|goto|if|implements|interface|instanceof|namespace|new|old_function|or|private|protected|public|static|switch|throw|try|use|var|while|xor', # reserved keywords
      '#00F' => '\$\w*', #variable
      '#0F0' => 'die|echo|empty|exit|eval|include|include_once|isset|list|require|require_once|return|print|unset' # reserved function
    },
    'separator' => '\n|;|\ '
   } }
end