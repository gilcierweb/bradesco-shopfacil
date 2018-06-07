RSpec.describe BradescoShopfacil do
  it "has a version number" do
    expect(BradescoShopfacil::VERSION).not_to be nil
  end

  it "sandbox default" do
    merchant_id = '90000'
    security_key = 'mykeysecret'
    bradesco_shopfacil = BradescoShopfacil::Shopfacil.new(merchant_id, security_key)
    sandbox = bradesco_shopfacil.sandbox

    expect(sandbox).to eq(false)
  end

  it "sandbox true" do
    merchant_id = '90000'
    security_key = 'SUA CHAVE'
    bradesco_shopfacil = BradescoShopfacil::Shopfacil.new(merchant_id, security_key)
    sandbox = bradesco_shopfacil.sandbox = true

    expect(sandbox).to eq(true)
  end
end
