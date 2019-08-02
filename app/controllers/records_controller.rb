class RecordsController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    def index
      @records = Record.order(:name)
      respond_to do |format|
      format.html
      format.csv { send_data @records.to_csv }
      #format.xls { send_data @records.to_xls }
      end
    end

    def import
      Record.import(params[:file])
      redirect_to root_url, notice: "Records imported."
    end

    def show
      @record = Record.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = Aip1.new(@record, view_context)
          send_data pdf.render, filename: "letter_#{@letter.letter_id}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
                                #disposition: "attachment"
        end
      end
    end
end
