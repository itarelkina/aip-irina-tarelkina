class LettersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    def index
        @letters = Letter.all
    end

    def show
      @letter = Letter.find(params[:id])
      respond_to do |format|
        format.html
        format.xml {render:xml => @letters}
        format.pdf do
          pdf = Aip1.new(@letter, view_context)
          send_data pdf.render, filename: "Letter_#{@letter.letter_number}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
                                #disposition: "attachment"
        end
      end
    end
end
