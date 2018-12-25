class TrackRecordsController < ApplicationController
  before_action :set_track_record, only: [:show, :update, :destroy]

  # GET /track_records
  def index
    @track_records = TrackRecord.all
    render json: @track_records.as_json(root: true)
  end

  # GET /track_records/1
  def show
    render json: @track_record.as_json(root: true)
  end

  # POST /track_records
  def create
    @track_record = TrackRecord.new(track_record_params)

    if @track_record.save
      render json: @track_record.as_json(root: true), status: :created, location: @track_record
    else
      render json: @track_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /track_records/1
  def update
    if @track_record.update(track_record_params)
      render json: @track_record.as_json(root: true)
    else
      render json: @track_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /track_records/1
  def destroy
    @track_record.destroy
    render json: @track_record
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track_record
      begin
        @track_record = TrackRecord.find(params[:id])
      rescue  StandardError => e  
          render json: e.message , status: :Record_not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def track_record_params
      params.require(:track_record).permit(:description, :track_for, :created_by)
    end
end
