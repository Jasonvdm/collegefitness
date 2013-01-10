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
      'Jump rope'
    ]
  end

  def difficulty_levels 
    [
      'Beginner',
      'Intermediate',
      'Advanced'
    ]
  end

  def workout_types
    [
      'Cardio',
      'Cross training',
      'Strength'
    ]
  end


  def google_analytics
    return if request.local?
    analytics = <<-EOF
      <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-23113828-4']);
        _gaq.push(['_trackPageview']);
        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      </script>
    EOF
    analytics.html_safe
  end
end
