def caesar_cipher(string, offset)

  # Create replacement strings that are offset
  to_replace_down = ("a".."z").to_a.rotate(offset).join
  to_replace_up = ("A".."Z").to_a.rotate(offset).join

  puts string.tr("a-zA-Z", to_replace_down + to_replace_up)

end 
