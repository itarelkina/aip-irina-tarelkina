class Aip1 < Prawn::Document
  def initialize(letter, view)
    super(top_margin:35)
    @letter = letter
    @view = view
    header_line
    body1
    record
    total_price
    table_salary
    body2
    body3
    signature
    footer
  end

  def header_line
  y_position = cursor
  image "#{Rails.root}/app/assets/images/logo1.jpg", :at => [0, y_position]
  move_down 20
  text "Your 2019 Compensation Confirmation 1", size: 16, style: :bold, align: :center
  move_down 10
  text "Personal & Confidential", size: 12, style: :bold, align: :right
  move_down 10
  end

  # top body part to change name to variable from DB
  def body1
    @letter.records.map do |item|
      [item.name]

  text "Dear #{item.name},", size: 12, style: :bold, align: :left
  move_down 10
  text "Pay for performance is at the core of our compensation philosophy. We reward our people for achieving corporate goals and meeting or exceeding performance expectations. Based on the outcome of your 2018 performance review, your merit increase has been calculated accordingly. Your salary increase calculation is as follows:", size: 11
    end
  end
  
  def table_salary
## to be designed yet
  end

  def body2
    text "Salary increases, if applicable, are effective Sunday, March 3, 2019 and will be reflected on the Thursday, March 14, 2019 pay stub. For more information on merit increases, please visit https://purolatorportal1.force.com/puronet/cms__Main?name=hr-compensation-merit.

    Your 2018 Annual Incentive Program (AIP) Payment:
    Based on your position at the end of 2018, your 2018 Target AIP is 15.00% of your annual salary. If you were in more than one AIP eligible position in 2018, your final payout will be prorated based on time spent in each position. Your AIP has two components, a personal component and a corporate component and your calculation is as follows:
    ", size: 11
  end

  def record
    move_down 14
    table record_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def record_rows
    [["AIP", "Qty", "Unit value", "Total Value"]] +
    @letter.records.map do |item|
      [item.name, item.quantity, price(item.unit_value), price(item.full_price)]
    end
  end
  
  def price(num)
    @view.number_to_currency(num)
  end
  
  def total_price
    move_down 10
    text "Total Bonus: #{price(@letter.total_price)}", size: 16, style: :bold
  end
  def body3
    text"If you are actively at work as of February 28, 2019, you will have the opportunity to allocate all or a part of your AIP amount to your Group RRSP, Spousal Group RRSP and/or Group TFSA account. You will receive a link with an online survey on March 4, 2019 to select your AIP allocation; the window will be open from March 4 to March 15, 2019.  You are required to have an active Group RRSP, Spousal Group RRSP and/or a Group TFSA account in order to transfer your AIP to any of these selections.  Should you indicate on the survey an allocation to the Group RRSP and/or Group TFSA and you do not have an active account, your AIP will be paid via direct deposit.  If you are inactive on or after February 28, 2019 your AIP will be paid via direct deposit.  Please note that there are applicable deductions and/or withholding taxes that will be applied to your AIP payout.  The Group RRSP, Group TFSA and direct deposits will be made by the end of March 2019.
    Thank you for your 2018 contributions. With your continued commitment and alignment to business goals, we look forward to a successful 2019.", size: 11  
  end

  def signature
    text "Sincerely,", size: 12, align: :left
    move_down 10
    y_position = cursor
    image "#{Rails.root}/app/assets/images/signature1.jpg", :at => [0, y_position]
    move_down 35
    
    text "John Ferguson", size: 12, align: :left
    move_down 10
    text "President and Chief Executive Officer", size: 12, align: :left
    move_down 40
  end

  def footer
    y_position = cursor
    image "#{Rails.root}/app/assets/images/Puro1.jpg", :at => [0, y_position]
    y_position = cursor
    image "#{Rails.root}/app/assets/images/TR1.jpg", :at => [400, y_position]
    move_down 40
  end
end
