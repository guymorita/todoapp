class Todo < ActiveRecord::Base
  def finished?
    if self.status == True
      puts "Finished"
    else
      puts "Unfinished"
    end
  end
end