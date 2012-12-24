module ApplicationHelper
	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def workout_equipment
    [
    	'Dumbbells',
    	'Pull-up bar',
    	'Resistance bands',
    	'Medicine ball',
    ]
  end
end
