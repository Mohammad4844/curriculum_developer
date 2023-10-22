class UserCurriculumController < ApplicationController
  def develop
    api_response = `python3 '#{params}' '#{Course.all}'`
    @curriculum = api_response
    render 'home/index'
  end
end
