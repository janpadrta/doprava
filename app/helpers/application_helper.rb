module ApplicationHelper
  def format_date(date)
    return '' if date.blank?
    date.strftime('%d.%m.%Y')
  end

  def ano_ne(test)
    test ? 'Ano' : 'Ne'
  end

  def format_currency(amount, unit)
    unit = '' if unit.blank?
    number_to_currency(amount, unit: unit, format: '%n %u')
  end
end
