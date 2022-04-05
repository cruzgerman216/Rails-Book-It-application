require "test_helper"

class ListingCategoriesTest < ActionDispatch::IntegrationTest

  def setup 
    @categoryOne = Category.create(name: "Sports")
    @categoryTwo = Category.create(name: "Non-fiction")
  end

  test "should list out categories" do 
    get '/categories' 
    assert_response :success 

    assert_select 'a[href = ?]', category_path(@categoryOne), text: @categoryOne.name 
    assert_select 'a[href = ?]', category_path(@categoryTwo), text: @categoryTwo.name 
  end
end
