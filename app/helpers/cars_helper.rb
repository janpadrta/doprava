module CarsHelper
  def crossed?(car)
    car.active? ? '' : 'crossed'
  end
end
