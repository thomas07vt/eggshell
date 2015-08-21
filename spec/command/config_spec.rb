require_relative '../spec_helper'

describe "Config" do

  context '.load!' do
    before do
      conf = YAML.load_file("#{Eggshell.home}/config.yml")
      expect(conf['global']).to eq(true)
    end

    it 'sets the default global to true by default' do
      Eggshell::Config.load!
      expect(Eggshell::Config[:global]).to eq(true)
    end

  end

  context '.initialize' do

    it 'parses options' do
      expect_any_instance_of(OptionParser).to receive(:parse!)
      Eggshell::Config.new
    end

  end

  context '#show' do
    it 'loads the config.yml file'
  end

end
