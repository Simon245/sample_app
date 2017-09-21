require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = 'Ruby on Rails Tutorial Sample App'
    @user = users(:michael)
  end

  test 'should get home' do
    get root_path
    assert_response :success
    assert_select 'title', @base_title.to_s
  end

  test 'should get help' do
    get help_path
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"
  end

  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end

  test 'should get contact' do
    get contact_path
    assert_response :success
    assert_select 'title', "Contact | #{@base_title}"
  end

  test 'should get users' do
    log_in_as(@user)
    assert is_logged_in?
    get users_path
    assert_response :success
    assert_select 'title', "All users | #{@base_title}"
  end

  test 'should get settings' do
    log_in_as(@user)
    assert is_logged_in?
    get user_path(@user)
    assert_response :success
    assert_select 'title', "#{@user.name} | #{@base_title}"
  end

  test 'should get edit profile' do
    log_in_as(@user)
    assert is_logged_in?
    get edit_user_path(@user)
    assert_response :success
    assert_select 'title', "Edit user | #{@base_title}"
  end


end
