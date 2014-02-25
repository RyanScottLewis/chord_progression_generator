require 'spec_helper'

describe ChordProgressionGenerator::Parser do
  
  describe '#parse' do
    
    subject { described_class.new }
    
    it 'should parse a 2 chord progression correctly' do
      subject.parse('    I     >      V      ').should == {
        roman_numeral: 'I',
        child: {
          roman_numeral: 'V'
        }
      }
    end
    
    it 'should parse a 4 chord progression correctly' do
      subject.parse('    I     >      IV     >       V    >       I     ').should == {
        roman_numeral: 'I',
        child: {
          roman_numeral: 'IV',
          child: {
            roman_numeral: 'V',
            child: {
              roman_numeral: 'I'
            }
          }
        }
      }
    end
    
  end
  
end
