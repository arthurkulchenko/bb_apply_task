shared_examples_for "Responce is OK" do
  it 'return 200 status' do
    expect(response).to have_http_status(:success)
  end
end
