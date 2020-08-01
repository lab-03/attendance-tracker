class AttendancesController < ApplicationController


def create
   @captured_face = "https://media1.popsugar-assets.com/files/thumbor/wPKqK3PAN3Tg-5NKK93bJPq_0-Q/66x304:2000x2238/fit-in/500x500/filters:format_auto-!!-:strip_icc-!!-/2019/12/11/092/n/1922398/3bc9a6e15df19424c50347.66856259_/i/Steve-Carell.jpg"
   @orignal_face = "https://upload.wikimedia.org/wikipedia/commons/9/96/Steve_Carell_November_2014.jpg"    #params[:student].image_url
   @response = Faraday.post("https://gp-verifier.herokuapp.com/api/Fr",
   	{:original_face => @original_face,
    :captured_face => @captured_face 
    }
    )
   	if(@response.status == 200)
   		render json: "succeded"
   	else
   	   render json: "failed" 	
   end


end



end
