class ProductsController < ApplicationController
  
  load_and_authorize_resource
  def index
    @products = Product.paginate(page: params[:page], per_page: 3)
      respond_to do |format|
        format.html
        # format.xlsx
        format.json { render json: { products: @products } }
      end
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @seller = Seller.find(params[:seller_id])
    @product = @seller.products.create(product_params)
    redirect_to seller_path(@seller)
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

  def destroy
    @seller = Seller.find(params[:seller_id])
    @product = @seller.products.find(params[:id])
    @product.destroy
    redirect_to seller_path(@seller), status: 303
  end

  private

  def product_params
    params.require(:product).permit(:image, :title, :description, :price, :seller_id, :video)
  end
end
