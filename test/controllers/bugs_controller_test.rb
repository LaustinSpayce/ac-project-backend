require 'test_helper'

class BugsControllerTest < ActionDispatch::IntegrationTest
  setup { @bug = bugs(:one) }

  test 'should get index' do
    get bugs_url, as: :json
    assert_response :success
  end

  test 'should create bug' do
    assert_difference('Bug.count') do
      post bugs_url,
           params: {
             bug: {
               end_time: @bug.end_time,
               image: @bug.image,
               internal_id: @bug.internal_id,
               name: @bug.name,
               rarity: @bug.rarity,
               sell: @bug.sell,
               start_time: @bug.start_time,
               weather: @bug.weather,
               where: @bug.where
             }
           },
           as: :json
    end

    assert_response 201
  end

  test 'should show bug' do
    get bug_url(@bug), as: :json
    assert_response :success
  end

  test 'should update bug' do
    patch bug_url(@bug),
          params: {
            bug: {
              end_time: @bug.end_time,
              image: @bug.image,
              internal_id: @bug.internal_id,
              name: @bug.name,
              rarity: @bug.rarity,
              sell: @bug.sell,
              start_time: @bug.start_time,
              weather: @bug.weather,
              where: @bug.where
            }
          },
          as: :json
    assert_response 200
  end

  test 'should destroy bug' do
    assert_difference('Bug.count', -1) { delete bug_url(@bug), as: :json }

    assert_response 204
  end
end
