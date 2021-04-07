class GenerateContractController < ApplicationController
  layout 'pdf_contract'

  def show
    @order = Order.includes(:customer, :car).find(params[:order_id])
    @jhtrans = Customer.jhtrans.first
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Smlouva_#{@order.label}_",
               layout: 'layouts/pdf_contract.html.erb',
               margin:  {   top:               25,                     # default 10 (mm)
                            bottom:            25,
                            left:              25,
                            right:             25 }
      end
    end
  end
end
