require 'parslet' 

module ChordProgressionGenerator
  
  class Parser < Parslet::Parser
    
    rule(:space)  { match('\s').repeat(1) }
    rule(:space?) { space.maybe }
    
    rule(:roman_numeral) do
      ( str('i')   | str('I')   |
        str('ii')  | str('II')  |
        str('iii') | str('III') |
        str('iv')  | str('IV')  |
        str('v')   | str('V')   |
        str('vi')  | str('VI')  |
        str('vii') | str('VII') ).as(:roman_numeral)
    end
    rule(:roman_numeral?) { roman_numeral.maybe }
    
    rule(:connector)  { str('>') }
    rule(:connector?) { connector.maybe }
    
    rule(:connected_roman_numeral) { space? >> roman_numeral? >> space? >> connector? >> space? }
    rule(:expression) do
      connected_roman_numeral.repeat
    end
    
    root(:expression)
    
  end
  
end

require 'pp'
pp ChordProgressionGenerator::Parser.new.parse("    I     >    IV  ")
# pp ChordProgressionGenerator::Parser.new.parse("I > IV > V > I")