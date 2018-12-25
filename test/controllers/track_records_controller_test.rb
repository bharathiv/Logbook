require 'test_helper'

class TrackRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @track_record = track_records(:one)
  end

  test "should get index" do
    get track_records_url, as: :json
    assert_response :success
  end

  test "should create track_record" do
    assert_difference('TrackRecord.count') do
      post track_records_url, params: { track_record: { created_by: @track_record.created_by, description: @track_record.description, track_for: @track_record.track_for } }, as: :json
    end

    assert_response 201
  end

  test "should show track_record" do
    get track_record_url(@track_record), as: :json
    assert_response :success
  end

  test "should update track_record" do
    patch track_record_url(@track_record), params: { track_record: { created_by: @track_record.created_by, description: @track_record.description, track_for: @track_record.track_for } }, as: :json
    assert_response 200
  end

  test "should destroy track_record" do
    assert_difference('TrackRecord.count', -1) do
      delete track_record_url(@track_record), as: :json
    end

    assert_response 204
  end
end
