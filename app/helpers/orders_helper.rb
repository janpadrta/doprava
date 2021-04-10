module OrdersHelper
  def stop_line_style(stop)
    return 'loading' if stop.class == Stop::Loading && !stop.way_back
    return 'back_loading' if stop.class == Stop::Loading && stop.way_back
    return 'unloading' if stop.class == Stop::Unloading && !stop.way_back
    return 'back_unloading' if stop.class == Stop::Unloading && stop.way_back
    ''
  end

  def crossed?(order)
    order.finished ? 'crossed' : ''
  end
end
