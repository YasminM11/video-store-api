require "test_helper"

describe Customer do
  let (:valid_customer) { customers(:customer1) }

  describe 'validation' do
    describe 'validate customer name' do  
      it "is invalid without a name" do 
        valid_customer[:name] = nil
        expect(valid_customer.valid?).must_equal false
      end

      it "works if the name is valid" do
        expect(valid_customer.valid?).must_equal true
      end
    end

    describe 'validate address' do
      it "is invalid without an address" do
        valid_customer[:address] = nil
        expect(valid_customer.valid?).must_equal false
      end


      it "works if the address is valid" do
        expect(valid_customer.valid?).must_equal true
      end
    end

    describe 'validate city' do
      it "is invalid without a city" do
        valid_customer[:city] = nil
        expect(valid_customer.valid?).must_equal false
      end
      

      it "works if the city is valid" do
        expect(valid_customer.valid?).must_equal true
      end
    end

    describe 'validate state' do
      it "is invalid without a state" do
          valid_customer[:state] = nil
          expect(valid_customer.valid?).must_equal false
        end
        
      it "works if the state is valid" do
        expect(valid_customer.valid?).must_equal true
      end
    end

    describe 'validate postal_code' do
      it "is invalid without a postal_code" do
            valid_customer[:postal_code] = nil
            expect(valid_customer.valid?).must_equal false
          end
        
      it "works if the postal_code is valid" do
        expect(valid_customer.valid?).must_equal true
      end
    end

    describe 'validate phone' do
      it "is invalid without a phone" do
            valid_customer[:phone] = nil
            expect(valid_customer.valid?).must_equal false
          end
        
      it "works if the phone is valid" do
        expect(valid_customer.valid?).must_equal true
      end
    end
  end



  describe 'relations' do  
      
    it "has many rentals" do
      valid_customer.must_respond_to :rentals
      # expect(valid_customer.rentals.length).must_equal 2
      valid_customer.rentals.each do |rental|
        expect(rental).must_be_kind_of Rental
      end
    end
  end
end
