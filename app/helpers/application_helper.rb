module ApplicationHelper
  def format_date(date)
    return '' if date.blank?
    date.strftime('%d.%m.%Y')
  end

  def ano_ne(test)
    test ? 'Ano' : 'Ne'
  end

  def format_currency(amount, unit, precision = 2)
    unit = '' if unit.blank?
    number_to_currency(amount, unit: unit, format: '%n %u', precision: precision)
  end

  def invoice_class(invoice)
    return 'red' if invoice.due_date < Date.today
    return 'yellow' if invoice.due_date.between?(Date.today, 1.week.since)
    'green'
  end
end
