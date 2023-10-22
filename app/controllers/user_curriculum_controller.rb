class UserCurriculumController < ApplicationController
  def index
    @courses = Course.where(id: [6,1,9,  3,4, 2,  10,5 , 12  ])
    @courses = @courses.to_a
    temp  = @courses[8]
    @courses[8] = @courses[1]
    @courses[1] = temp
    temp  = @courses[6]
    @courses[6] = @courses[0]
    @courses[0] = temp
    render 'home/curriculum'
  end

  def develop
    # p "python3 vertex_ai_api_call.py '#{params.to_json.to_s}' '#{Course.all.inspect}'"
    api_response = `python3 vertex_ai_api_call.py '#{params.to_json}' '#{Course.all.pluck(:title, :prereqs, :course_hrs_week).to_json}'`
    @curriculum = JSON.parse(api_response)
    render 'home/index'
  end
end
