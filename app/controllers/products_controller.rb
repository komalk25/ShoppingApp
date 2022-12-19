class ProductsController < ApplicationController
  # before_action :set_product, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def show
    @product = Product.find(params[:id])
    # @seller = Seller.find(params[:seller_id])
    # @product = @seller.products.find(params[:id])
  end

  def create
    binding.pry
    @seller = Seller.find(params[:seller_id])
    @product = @seller.products.create(product_params)
    redirect_to seller_path(@seller)
    # @product = Product.new(product_params)
  end

  def edit
    @seller = Seller.find(params[:seller_id])
    @product = @seller.products.find(params[:id])
  end

  def update
    @seller = Seller.find(params[:seller_id])
    @product = @seller.products.find(params[:id])
    if @product.update(product_params)
      redirect_to @seller
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
# DELETE /products/1 or /products/1.json
def destroy
  @seller = Seller.find(params[:seller_id])
  @product = @seller.products.find(params[:id])
  @product.destroy
  redirect_to seller_path(@seller), status: 303
  #  @product.destroy
end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_product
  #    @product = Product.find(params[:id])
  #  end
  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:image, :title, :description, :price, :seller_id, :video)
  end
end
