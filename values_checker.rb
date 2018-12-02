class ValuesChecker
  def self.check_params(par_hash)
  end

  def self.empty_values(par_hash)
    empty_values = Array.new
    par_hash.each_pair do |key,val|
      empty_values.push(key) if val == ""
    end
    return empty_values
  end

  def self.right_date(par_hash)
    begin
      Date.strptime(par_hash[:release_date], "%e/%m/%Y")
      return nil
    rescue ArgumentError
      return :release_date
    end
  end
end
