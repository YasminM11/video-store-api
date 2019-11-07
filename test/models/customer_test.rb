require "test_helper"

describe Customer do
  let (:erika) { customers(:customer1) }

  describe 'validation' do  
    it "require a name" do 
      erika[:name] = nil
      expect(erika.valid?).must_equal false
    end

    it "works  if the name is valid" do
      expect(erika.valid?).must_equal true
    end
  end

  describe 'relations' do  
      
    it "has many rentals" do
      erika.must_respond_to :rentals
      # expect(erika.rentals.length).must_equal 2
      erika.rentals.each do |rental|
        expect(rental).must_be_kind_of Rental
      end
    end
  end
end
