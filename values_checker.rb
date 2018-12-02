class ValuesChecker
  @@inv_val = []
  def self.right_inputs(par_hash)
    empty_values(par_hash)
    date_format(par_hash)
  end

  def self.reset
    @@inv_val = []
  end

  private
  def self.empty_values(par_hash)
    par_hash.each_pair do |k,v|
      @@inv_val.push(k) if v == ""
    end
  end
  def self.date_format(par_hash)
    begin
      return Date.strptime(par_hash["release_date"], "%e/%m/%Y")
    rescue
      return nil if @@inv_val.push.include? "release_date"
      @@inv_val.push("release_date")
    end
  end
end
