class Customer::ProductsController < ApplicationController

    def top
        @products = Product.all.order(created_at: :asc)
        @genres = Genre.all

    end

    def about
    end

    def index
        @genres = Genre.all
        @products = Product.where(sale_status: true)
        def search
          @value = params["search"]["value"]         #データを代入
          @how = params["search"]["how"]             #データを代入
          @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
        end
    end

    def show
        @products = Product.all
        @product = Product.find(params[:id])
        @cart_item = CartItem.new
    end

	private
    	def product_params
    		parmas.require(:product).permit(:products_image_id,:name, :products_explanation, :non_taxed_price, :sale_status,)
    	end

    	 def match(value)
            #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
            Product.where(name: value).or(Product.where(genre_id: value))
         end

      def search_for(how, value)
        case how                     #引数のhowと一致する処理に進むように定義しています。
        when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
          match(value)
        # when 'forward'
        #   forward(value)
        # when 'backward'
        #   backward(value)
        # when 'partical'
        #   partical(value)
        end
      end

end

