class SellerController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_seller!
  def index
    @seller = Seller.all
    @report = OrderItem.joins(product: :seller).all.group(:name).count
    respond_to do |format|
      format.html
      format.xlsx
      format.pdf do
<<<<<<< HEAD
        render pdf: "products" , template: "seller/report", formats: [:html], 
        layout: 'pdf',
        page_size: 'A4'
=======
        render pdf: 'products', template: 'seller/report', formats: [:html],
               layout: 'pdf',
               page_size: 'A4'
>>>>>>> c9a5a24003fd56552760794751a656bffc295ee5
      end
    end
  end

  def show
    @seller = Seller.find(params[:id])
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to @seller
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @seller = Seller.find(params[:id])
  end

  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      redirect_to @seller
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @seller = Seller.find(params[:id])
    @seller.destroy
    redirect_to seller_path, status: :see_other
  end

  private

  def seller_params
    params.require(:seller).permit(:name)
  end
end
