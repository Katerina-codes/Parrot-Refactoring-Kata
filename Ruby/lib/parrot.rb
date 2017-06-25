class Parrot
  BASE_SPEED = 12.0

  def initialize type, number_of_coconuts, voltage, nailed
    @type = type;
    @number_of_coconuts = number_of_coconuts;
    @voltage = voltage;
    @nailed = nailed;
  end

  def speed
    parrots_speed = {
      european_parrot: BASE_SPEED,
      african_parrot: AfricanParrot.new(BASE_SPEED, @number_of_coconuts).speed,
      norwegian_blue_parrot: NorwegianBlueParrot.new(BASE_SPEED, @nailed, @voltage).speed
    }
    parrots_speed[@type]
  end

end

class AfricanParrot
  LOAD_FACTOR = 9.0

  def initialize(base_speed, number_of_coconuts)
    @base_speed = base_speed
    @number_of_coconuts = number_of_coconuts
  end

  def speed
    [0, @base_speed - LOAD_FACTOR * @number_of_coconuts].max
  end
end

class NorwegianBlueParrot

  def initialize(base_speed, nailed, voltage)
    @base_speed = base_speed
    @nailed = nailed
    @voltage = voltage
  end

  def speed
    (@nailed) ? 0 : compute_base_speed_for_voltage
  end

  private

  def compute_base_speed_for_voltage
    [24.0, @voltage * @base_speed].min
  end

end
