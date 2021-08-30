class AnswersController < AuthenticationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :find_question, only: %i{new create}

  # GET /answers or /answers.json

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @answer = @question.answer.new(answer_params)
    if @answer.save
      redirect_to @answer, notice: 'Answer was seccusfully created.'
    else
      render :new
    end
  end

  def update
    if @answer.udpate
      redirect_to @answer
      render :edit
    end
  end

  def destroy
    if @answer.destroy(answer_params)
      redirect_to @answer.question
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_question
      @question = Question.find(params:[question_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
