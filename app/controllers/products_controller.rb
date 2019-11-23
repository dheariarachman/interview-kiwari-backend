class ProductsController < ApplicationController

    before_action :set_product, only: [:show, :update, :destroy]

    def info
        json_response({name: "Belanja API Demo", version: "1.0.0"}, "Success", 200)
    end

    def index
        @item = Item.all
        json_response(@item, "Success", 200)
    end

    def show
        json_response(@product, "Success")
    end

    def create
        @product = Item.new(product_params)
        if @product.save
            json_response(@product, "Succedd", 200)
        else
            json_response(@product, "Failed", 403)
        end
    end

    def destroy
        @product.delete
        json_response([], "Success", 200)
    end

    def update
        if @product.update(product_params)
            json_response(@product, "Success", 200)
        else
            json_response(@product, "Failed", 403)
        end
    end

    private

    def product_params
        params.permit(:name, :price, :image)
    end

    def set_product
        @product = Item.find(params[:id])
    end
end
