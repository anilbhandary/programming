################################################
# https://www.codechef.com/problems/DOWNLOAD
################################################
class AlienIntrusion
  
  attr_accessor :no_recipes, :recipe_time_intervals, :no_groups, :group_arrival_times, :no_downloaded_videos
  
  def initialize
    @no_recipes = 1
    @recipe_time_intervals = []
    @no_groups = 1
    @group_arrival_times = []
    @no_downloaded_videos = []
  end
  
  def start
    get_intrusion_plan
  end
  
  def intrude
    group_arrival_times.each_with_index do |arrival_time, index|
      no_downloaded_videos << figure_no_dwnld_videos_for(arrival_time, index)
    end
  end
  
  def show_results
    puts no_downloaded_videos
  end
  
  private
  def figure_no_dwnld_videos_for(arrival_time, group_no)
    temp_time_blocks = recipe_time_intervals.clone
    temp_time_blocks2 = recipe_time_intervals.clone
    group_arrival_times[group_no].each do |time|
      if (temp_time_blocks.count > 0)
        temp_time_blocks.each do |time_block|
          if within_range(time_block, time)
            temp_time_blocks2.delete(time_block)
          end
        end
      end
    end
    recipe_time_intervals.count - temp_time_blocks2.count
  end
  
  def within_range(range, time)
    (range[0] <= time && time <= range[1]) 
  end
  
  def get_intrusion_plan
    # Get recipe information
    self.no_recipes = get_std_input.to_i
    
    no_recipes.times do
      cur_recipe_time_period = get_std_input.split.collect {|x| x.to_i}
      add_recipe_time_interval(cur_recipe_time_period)
    end

    # Get group information
    self.no_groups = get_std_input.to_i

    no_groups.times do
      cur_group_arrival_info = get_std_input.split.collect {|x| x.to_i}
      cur_group_arrival_time = extract_group_arrival_time(cur_group_arrival_info)
      add_group_arrival_time(cur_group_arrival_time)
    end
  end
  
  def extract_group_arrival_time(group_arrival_info)
    group_arrival_info[1..-1]
  end
  
  def add_recipe_time_interval(time_period)
    recipe_time_intervals << time_period
  end
  
  def add_group_arrival_time(group_arrival_time)
    group_arrival_times << group_arrival_time
  end
  
  def get_std_input
    gets.chomp
  end
end

a = AlienIntrusion.new
a.start
a.intrude
a.show_results
