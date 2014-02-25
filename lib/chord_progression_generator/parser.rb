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
    
    rule(:connector) { str('>') }
    
    rule(:connected_node) { space? >> connector >> node.as(:child) }
    rule(:node) { space? >> roman_numeral >> connected_node.maybe }
    
    root(:node)
    
  end
  
end
