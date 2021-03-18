class ApplicationController < ActionController::Base
  before_action :require_login

  before_action :zapis_uzivatele_do_logu

  def zapis_uzivatele_do_logu
    string = "\n-----------------------------------------------------\n"
    string += "V #{Time.zone.now.strftime('%d.%m.%Y %H:%M:%S')} provadi uzivatel #{current_user.blank? ? 'neprihlasen' : current_user.email} (#{request.env['REMOTE_HOST']}) "
    string += "akci kontroleru = #{params[:controller]}::#{params[:action]} "
    string += "s ID=#{params[:id]} " if params[:id]
    string += "\nparams: #{params} " if params
    string += "\n-----------------------------------------------------\n "
    logger.info(string)
  end

  helper_method
  def jhtrans
    Customer.jhtrans.first
  end

  helper_method :current_users_list
  protected
  def current_users_list
    User.get_current_users.map {|u| u.name}.join(", ")
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Nejprve se prosím přihlaste."
  end
end
