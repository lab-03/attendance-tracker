require_relative './spec_helper.rb'
require_relative '../test.rb'
RSpec.describe Rearrange do

     describe 'solve' do
       
        

        it 'answer' do
           x=Rearrange.new
           y='123456'
           z=x.solve(y)

           expect(z).to eq('654321')
        end

    end


end