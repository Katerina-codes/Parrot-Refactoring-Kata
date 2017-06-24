class Parrot
  def initialize type, number_of_coconuts, voltage, nailed
    @type = type;
    @number_of_coconuts = number_of_coconuts;
    @voltage = voltage;
    @nailed = nailed;
  end

  def speed
    case @type
    when :european_parrot
      return EuropeanParrot.new.speed
    when :african_parrot
      return AfricanParrot.new(@number_of_coconuts).speed
    when :norwegian_blue_parrot
      return (@nailed) ? 0 : compute_base_speed_for_voltage(@voltage);
    end

    throw "Should be unreachable!";
  end

  private

  def compute_base_speed_for_voltage voltage
   [24.0, voltage * base_speed].min
  end

  def load_factor
    9.0;
  end

  def base_speed
    12.0;
  end
end

class EuropeanParrot
  def speed
    12.0
  end
end

class AfricanParrot
  BASE_SPEED = 12.0
  LOAD_FACTOR = 9.0

  def initialize(number_of_coconuts)
    @number_of_coconuts = number_of_coconuts
  end
  def speed
    [0, BASE_SPEED - LOAD_FACTOR * @number_of_coconuts].max
  end
end
