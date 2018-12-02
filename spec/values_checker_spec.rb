require './values_checker'

describe ValuesChecker do
  let(:emp_bt) {{"title" => "", "release_date" => ""}}
  before(:each) do
    ValuesChecker.class_variable_set(:@@inv_val, [])
  end
  context 'empty values' do
    let(:emp_ti) {{"title" => "", "release_date" => "28/07/017"}}
    let(:emp_da) {{"title" => "foo", "release_date" => ""}}

    it 'empty title' do
      ValuesChecker.right_inputs(emp_ti)
      expect(ValuesChecker.class_variable_get(:@@inv_val)).to eq ["title"]
    end
    it 'empty date' do
      ValuesChecker.right_inputs(emp_da)
      expect(ValuesChecker.class_variable_get(:@@inv_val)).to eq ["release_date"]
    end
    it 'both empty' do
      ValuesChecker.right_inputs(emp_bt)
      expect(ValuesChecker.class_variable_get(:@@inv_val)).to eq ["title","release_date"]
    end
  end
  context 'wrong date format' do
    let(:wrg_da) {{"title" => "foo", "release_date" => "28 July 2013"}}
    let(:rgt_da) {{"title" => "foo", "release_date" => "28/07/2013"}}

    it 'gets a wrong date format' do
      ValuesChecker.right_inputs(wrg_da)
      expect(ValuesChecker.class_variable_get(:@@inv_val)).to eq ["release_date"]
    end
    it 'gets a right date format' do
      ValuesChecker.right_inputs(rgt_da)
      expect(ValuesChecker.class_variable_get(:@@inv_val)).to eq []
    end
  end
  context 'reset' do
    it 'reset variable' do
      ValuesChecker.right_inputs(emp_bt)
      ValuesChecker.reset
      expect(ValuesChecker.class_variable_get(:@@inv_val)).to eq []
    end
  end

end
