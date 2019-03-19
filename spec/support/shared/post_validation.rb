shared_examples_for "Post validation" do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
end
