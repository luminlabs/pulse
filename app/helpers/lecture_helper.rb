module LectureHelper
 require 'rubyvis'
 require 'gchart'



   def googlegraph(statusarray)
   		Gchart.bar(:data => [statusarray[0], statusarray[1],statusarray[2]], 
   			 :bar_colors => 'FF0000',
   			 :bar_width_and_spacing => '150,15', :size => '600x200')


# Gchart.bar(:data => [4,8,9], 
#    			 :bar_colors => 'FF0000',
#    			 :bar_width_and_spacing => '150,15', :size => '600x200')
   		# :legend => ['Not Following', "I'm With You", "Got It! Move On"]
   end

   	def getstatus
      @lecture = Lecture.find(params[:id])
      @lecture.notcount = 0
      @lecture.followingcount = 0 
      @lecture.goaheadcount = 0

      @lecture.users.each do |user|
        case user.currentstatus
          when 0 then idlecount = idlecount + 1
          when 1 then @lecture.notcount = @lecture.notcount + 1 
          when 2 then @lecture.followingcount = @lecture.followingcount + 1
          when 3 then @lecture.goaheadcount = @lecture.goaheadcount + 1
     	end

  end
  statusmap = [@lecture.notcount,@lecture.followingcount,@lecture.goaheadcount]
end

end


