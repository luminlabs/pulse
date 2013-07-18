module LectureHelper
 require 'rubyvis'
 require 'gchart'



   def googlegraph 
   		Gchart.bar(:data => [30, 10, 30], 
   			 :bar_colors => 'FF0000',
   			 :bar_width_and_spacing => '150,15', :size => '600x200')

   		# :legend => ['Not Following', "I'm With You", "Got It! Move On"]
   end

end


