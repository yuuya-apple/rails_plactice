class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def update
    @task.update!(task_params)
    redirect_to(tasks_url, notice: "タスク「#{@task.name}」を更新しました。")
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to(@task, notice: "タスク「#{@task.name}」を登録しました。")
    else
      render new
    end
  end

  def destroy
    @task.destroy
    redirect_to(tasks_url, notice: "タスク「#{@task.name}」を削除しました。")
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
