class StaticController < ApplicationController
  def home
    @missed_invoices = Invoice.includes(:order).not_paid.po_splatnosti(Date.today)
    @missing_one_week_invoices = Invoice.includes(:order).not_paid.tyden_do_splatnosti(Date.today).spatnost_vyssi_nez(Date.today)
  end

  def about
  end

  def contact
  end
end
