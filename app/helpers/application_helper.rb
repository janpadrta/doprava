module ApplicationHelper
  def format_date(date)
    return '' if date.blank?
    date.strftime('%d.%m.%Y')
  end

  def ano_ne(test)
    test ? 'Ano' : 'Ne'
  end
end
