class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def galeria
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "Obrazek #{@resume.name} zostal dodany."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "Obrazek #{@resume.name} zostal usuniety."
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end