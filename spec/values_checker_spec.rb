require './values_checker'

describe ValuesChecker do
  let (:empdate_hash) {{title: "foo", release_date: ""}}
  context 'empty values' do
    let (:emptitle_hash) {{title: "", release_date: "28/07/2013"}}
    let (:empboth_hash) {{title: "", release_date: ""}}
    it 'found empty title' do
      expect(ValuesChecker.empty_values(emptitle_hash)).to eq [:title]
    end
    it 'found empty date' do
      expect(ValuesChecker.empty_values(empdate_hash)).to eq [:release_date]
    end
    it 'found both empy' do
      expect(ValuesChecker.empty_values(empboth_hash)).to eq [:title, :release_date]
    end
  end
  context 'wrong date format' do
    let (:wrongtime_hash) {{title: "foo", release_date: "28 July 2013"}}
    it 'found not time was not given' do
      expect(ValuesChecker.right_date(empdate_hash)).to be :release_date
    end
    it 'wrong time format given' do
      expect(ValuesChecker.right_date(wrongtime_hash)).to be :release_date
    end
  end
end
