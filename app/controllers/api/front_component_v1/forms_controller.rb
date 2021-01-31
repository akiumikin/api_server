module Api::FrontComponentV1
  class FormsController < ApplicationController
    def default_value
      data ={
        phonenumber: '000-1234-5678',
      }

      render json: data
    end
  end
end
