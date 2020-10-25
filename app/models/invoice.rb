# == Schema Information
#
# Table name: invoices
#
#  id                     :bigint           not null, primary key
#  date_of_issue          :date
#  date_of_taxable_supply :date
#  due_date               :date
#  paid_on                :date
#  payment_type           :text
#  reference_number       :text
#  tax_base               :decimal(10, 3)
#  to_be_paid             :decimal(10, 3)
#  vat                    :decimal(10, 3)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  customer_id            :integer
#  order_id               :bigint           not null
#  user_id                :bigint           not null
#
# Indexes
#
#  index_invoices_on_order_id  (order_id)
#  index_invoices_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (user_id => users.id)
#
class Invoice < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_many :invoice_lines, dependent: :destroy
  belongs_to :customer

  after_initialize :po_inicializaci
  before_create :pred_vytvorenim

  scope :po_splatnosti, -> (date) { where('due_date < ?', date) }
  scope :spatnost_vyssi_nez, -> (date) { where('due_date >= ?', date) }
  scope :tyden_do_splatnosti, -> (date) { po_splatnosti(7.days.since(date)) }
  scope :not_paid, -> { where(paid_on: nil) }
  scope :paid, -> { where.not(paid_on: nil) }

  scope :issued_this_year, -> { where(date_of_issue: Date.today.beginning_of_year..Date.today.end_of_year) }

  def currency
    self.order.currency
  end

  def vat_percentage
    self.order.vat_percentage
  end

  def paid?
    self.paid_on.present?
  end

  private

  def pred_vytvorenim
    self.invoice_lines << InvoiceLine.new(
      label: 'Dopravní služby',
      price: self.tax_base,
      price_with_vat: self.to_be_paid,
      vat: self.vat,
      vat_percent: self.vat_percentage
    )
  end

  def po_inicializaci
    self.reference_number ||= "#{Date.today.year}#{(Invoice.issued_this_year.count + 1).to_s.rjust(6, "0")}"

    self.date_of_issue ||= Date.today
    self.date_of_taxable_supply ||= Date.today
    self.due_date ||= 60.days.since

    self.tax_base ||= self.order.full_price
    self.vat ||= self.order.vat_price
    self.to_be_paid ||= self.order.price_with_vat
  end
end
