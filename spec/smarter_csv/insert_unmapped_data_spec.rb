require 'spec_helper'

fixture_path = 'spec/fixtures'

describe ':insert_unmapped_data option' do


  it 'has no effect if provided without :insert_unmapped_data' do
  	options = {}
    data = SmarterCSV.process("#{fixture_path}/unmapped_data.csv", options)
    data.size.should eq 1
    data.first.size.should eq 3 # there are some empty rows in the fixture
  end
  
  it 'defaults to key as "insert_unmapped_keys" if no key provided' do
  	options = {insert_unmapped_data: true}
    data = SmarterCSV.process("#{fixture_path}/unmapped_data.csv", options)
    data.size.should eq 1
    data.first.size.should eq 4 # there are some empty rows in the fixture
    data.first["line_content"].should eq("USA,9.78,2001,1.56")
  end
 
   
  it "will add unmapped to data in provided key as arrays" do
  	options = {insert_unmapped_data: true, insert_unmapped_key: "extra_attributes"}
    data = SmarterCSV.process("#{fixture_path}/unmapped_data.csv", options)
    data.size.should eq 1
    data.first.size.should eq 4 # there are some empty rows in the fixture
    data.first["extra_attributes"].should eq("USA,9.78,2001,1.56")
  end
end


