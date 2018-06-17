class FruitsController < ApplicationController
  def index
    @q = Fruit.ransack(params[:q])
    @fruits = @q.result(:distinct => true).page(params[:page]).per(10)

    render("fruits/index.html.erb")
  end

  def show
    @fruit = Fruit.find(params[:id])

    render("fruits/show.html.erb")
  end

  def new
    @fruit = Fruit.new

    render("fruits/new.html.erb")
  end

  def create
    @fruit = Fruit.new


    save_status = @fruit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fruits/new", "/create_fruit"
        redirect_to("/fruits")
      else
        redirect_back(:fallback_location => "/", :notice => "Fruit created successfully.")
      end
    else
      render("fruits/new.html.erb")
    end
  end

  def edit
    @fruit = Fruit.find(params[:id])

    render("fruits/edit.html.erb")
  end

  def update
    @fruit = Fruit.find(params[:id])


    save_status = @fruit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/fruits/#{@fruit.id}/edit", "/update_fruit"
        redirect_to("/fruits/#{@fruit.id}", :notice => "Fruit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Fruit updated successfully.")
      end
    else
      render("fruits/edit.html.erb")
    end
  end

  def destroy
    @fruit = Fruit.find(params[:id])

    @fruit.destroy

    if URI(request.referer).path == "/fruits/#{@fruit.id}"
      redirect_to("/", :notice => "Fruit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Fruit deleted.")
    end
  end
end
