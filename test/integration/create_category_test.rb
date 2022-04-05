require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "should get new page and create category" do 
    sign_in_admin
    
    get '/categories/new'
    assert_response :success 

    assert_difference "Category.count" do 
      post '/categories', params: {category: {name: "Sports"}}
      assert_response :redirect
    end
    follow_redirect! 
    assert_response :success
    assert_match 'Sports', response.body
  end

end
