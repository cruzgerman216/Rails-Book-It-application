class CategoryTest < ActiveSupport::TestCase

    def setup 
        @category = Category.new(name: "Sports")
    end

    test "should create category" do 
        assert @category.valid?
    end

    test "should not be empty" do 
        @category.name = nil
        assert_not @category.valid?
    end

    test "should be unique" do 
        @category.save
        @categoryTwo = Category.new(name: "Sports")
        assert_not @categoryTwo.valid?
    end

    test "should be at least 2 characters" do 
        @category.name = "a"
        assert_not @category.valid?
    end

    test "should be no more than 25 characters" do 
        @category.name = "a" * 26
        assert_not @category.valid?
    end
end