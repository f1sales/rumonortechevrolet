require 'ostruct'
require 'byebug'

RSpec.describe F1SalesCustom::Hooks::Lead do
  let(:lead) do
    lead = OpenStruct.new
    lead.product = product
    lead.source = source

    lead
  end

  let(:product) do
    product = OpenStruct.new
    product.name = 'Https://Rumonortegm.Com.Br/Usados/Chevrolet Prisma 1 4 Mpfi Ltz 8v Flex 4p Automatico 1574875/'

    product
  end

  let(:source) do
    source = OpenStruct.new
    source.name = 'leadster'

    source
  end

  let(:switch_product) { described_class.switch_product_name(lead) }

  context 'when come form leadster switch product name' do
    it 'switch product name' do
      expect(switch_product).to eq('Chevrolet Prisma 1 4 Mpfi Ltz 8v Flex 4p Automatico 1574875')
    end

    context 'second test' do
      before { product.name = 'Https://Rumonortegm.Com.Br/Usados/Honda City 1 5 Ex 16v Flex 4p Automatico 1339571/' }

      it 'switch product name' do
        expect(switch_product).to eq('Honda City 1 5 Ex 16v Flex 4p Automatico 1339571')
      end
    end

    context 'third test' do
      before { product.name = 'Https://Rumonortegm.Com.Br/Usados/Nissan Kicks 1 6 16v Flexstart Exclusive Xtronic 1673201/' }

      it 'switch product name' do
        expect(switch_product).to eq('Nissan Kicks 1 6 16v Flexstart Exclusive Xtronic 1673201')
      end
    end

    context 'when product name is nil' do
      before { product.name = nil}

      it 'return empty' do
        expect(switch_product).to eq('')
      end
    end
  end

  context 'when lead is not from leadster' do
    before do
      source.name = 'Webmotors'
      product.name = 'Chery Tiggo 2 GAH0812'
    end

    it 'keep product name' do
      expect(switch_product).to eq('Chery Tiggo 2 GAH0812')
    end

    context 'when product name is nil' do
      before { product.name = nil }

      it 'return empty product name' do
        expect(switch_product).to eq('')
      end
    end
  end
end
