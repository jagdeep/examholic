class TeachersController < ApplicationController
  before_action :authenticate_student!
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = @account.teachers.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  private
    def set_teacher
      @teacher = Teacher.where(:id => params[:id]).first
    end
end
