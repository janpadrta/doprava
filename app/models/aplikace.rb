class Aplikace
  def self.wkhtmltopdf_path
    if OS.windows?
      'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe'
    else
      Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')
    end
  end
end