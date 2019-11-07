require "test_helper"

describe Customer do
  let (:erika) { customers(:customer1) }

  it "require a name" do 
    erika[:name] = nil
    expect(erika.valid?).must_equal false
  end
  describe 'relations' do  
    
      it 'has many rentals' do
      # customer = customers(:customer1)
      erika.must_respond_to :rental
      expect(customer.rentals).must_equal 2
      erika.rentals.each do |rental|
      expect(rental).must_be_instance_of Rental
      end
      it 'has no rentals' do
      erika.rentals.destroy_all
      erika.must_respond_to :rental
      expect(rental).must_equal nil
    end

  end
end
    
    

  


  # it "requires valid information for the customer" do
  #   required_fields = [:name, :address, :city, :state, :postal_code, :phone]
  #     expect(erika.name).must_equal "erika"
  # end
  # it "return an error if the info is not valid"
  # required_fields = [:name, :address, :city, :state, :postal_code, :phone]

end
