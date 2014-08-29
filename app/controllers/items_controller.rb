class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :assign_user]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @softwares = @item.software
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # GET /items/export
  def export
    @items = Item.all
    send_data @items.to_csv
  end
  # GET /items/import
  def import
  end
  # POST /items/import
  def import_file
    begin
      Item.import(params[:file])
      redirect_to root_url, notice: "Products imported. Duplicates are Ignored."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_user
    @users = User.all
  end

  def process_user
    @item = Item.find(params[:id])
    @user = User.find(params[:user_id])
    @item.user_id = @user.id
    if @item.save
      redirect_to item_path(@item)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:serial, :name, :manufacturer, :ubt_serial, :description, :user_id)
    end
end
