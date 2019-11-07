require "test_helper"

describe Customer do
  let (:erika) { customers(:customer1) }

  it "require a name" do 
    erika[:name] = nil
    expect(erika.valid?).must_equal false
  end

  it "works  if the name is valid" do
    expect(erika.valid?).must_equal true
end

describe 'relations' do  
     
  it "has many rentals" do
    erika = customers(:erika)
    erika.must_respond_to :rentals
    expect(erika.rentals.count).must_equal 2
    erika.rentals.each do |rental|
      expect(rental).must_be_kind_of Rental
    end
  end

    it "has no rentals" do
      erika.rentals.destroy_all
      erika.must_respond_to :rentals
      expect(rental).must_equal nil
    end
end
    
    

  


  # it "requires valid information for the customer" do
  #   required_fields = [:name, :address, :city, :state, :postal_code, :phone]
  #     expect(erika.name).must_equal "erika"
  # end
  # it "return an error if the info is not valid"
  # required_fields = [:name, :address, :city, :state, :postal_code, :phone]u

end
