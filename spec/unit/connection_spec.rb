require 'spec_helper'

describe 'Bigcommerce' do
  describe 'Connection' do
    context "initialize" do
      it "should return empty configuration hash" do
        expect(Bigcommerce::Connection.new({}).configuration).to eq({})
      end

      it "should return api_key in configuration hash" do
        api_key = 'abcdefg12345678'
        expect(Bigcommerce::Connection.new({:api_key => api_key}).configuration).to eq({:api_key => api_key})
      end

      it "should return store_url in configuration hash" do
        store_url = 'https://dom.tld'
        expect(Bigcommerce::Connection.new({:store_url => store_url}).configuration).to eq({:store_url => store_url})
      end

      it "should return store_url with path and query string stripped in configuration hash" do
        expect(Bigcommerce::Connection.new({:store_url => 'https://dom2.tld/path.ext?q=s'}).configuration)
                                      .to eq({:store_url => 'https://dom2.tld'})
      end

      it "should return username in configuration hash" do
        username = 'johncitizen'
        expect(Bigcommerce::Connection.new({:username => username}).configuration).to eq({:username => username})
      end

      it "should return ssl configuration hash" do
        options = {
          :ssl_client_cert => 'path/to/client.crt',
          :ssl_client_key => 'path/to/client.key',
          :ssl_ca_file => 'path/to/ca.crt',
          :verify_ssl => 1,
        }
        File.should_receive(:read).with('path/to/client.crt').once
        OpenSSL::X509::Certificate.should_receive(:new).once.and_return('path/to/client.crt')
        File.should_receive(:read).with('path/to/client.key').once
        OpenSSL::PKey::RSA.should_receive(:new).once.and_return('path/to/client.key')
        expect(Bigcommerce::Connection.new(options).configuration).to eq(options)
      end

      it "should return ssl_client_key when passed passphrase in configuration hash" do
        File.should_receive(:read).with('path/to/client.key').once
        OpenSSL::PKey::RSA.should_receive(:new).once.and_return('path/to/client.key')
        connection = Bigcommerce::Connection.new({})
        expect(connection.configuration).to eq({})
        expect(connection.ssl_client_key = ['path/to/client.key', 'yolo']).to be_nil
      end

      it " verify_ssl in configuration hash" do
        expect(Bigcommerce::Connection.new({:verify_ssl => 1}).configuration).to eq({:verify_ssl => 1})
      end
    end
  end
end

