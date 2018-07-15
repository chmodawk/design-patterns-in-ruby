class Task < Node
  def initialize(name, time_required = nil)
    super(name)
    @time_required = time_required
  end

  def time_required
    if leaf?
      @time_required
    else
      children.inject(0.0) { |time, task| time += child_task.time_required }
    end
  end
end
