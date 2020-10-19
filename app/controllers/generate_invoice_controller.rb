class GenerateInvoiceController < ApplicationController
  layout 'pdf_invoice'

  def show
    @invoice = Invoice.find(params[:invoice_id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Faktura_#{@invoice.reference_number}",
               layout: 'layouts/pdf_invoice.html.erb'
      end
    end
  end
end
