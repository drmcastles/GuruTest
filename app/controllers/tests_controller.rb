class TestsController < ApplicationController

  before_action :find_test, only: %i[show update destroy]

  def index
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.new(test_params)

    @test.author = User.all.first # delete leter

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
   if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end  
