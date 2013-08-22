helpers do
  def task_status(complete)
    if complete
      "complete"
    else
      "pending"
    end
  end
end
