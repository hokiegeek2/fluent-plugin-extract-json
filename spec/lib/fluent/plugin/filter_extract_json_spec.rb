describe Fluent::ExtractJsonFilter do
  before do
    Fluent::Test.setup
  end

  let(:driver)   { Fluent::Test::FilterTestDriver.new(Fluent::ExtractJsonFilter, 'test.metrics').configure(config) }
  let(:instance) { driver.instance }

  let(:config) do
    %[
      key jsonkey
    ]
  end

  describe "config" do
    it "should get key" do
      expect( instance.key ).to eq "jsonkey"
    end
  end

  describe "#emit" do
    it "extracts json" do
      driver.run do
        driver.emit("jsonkey" => '{"a":1}')
        driver.emit("jsonkey" => '{"a":1}', "notjsonkey" => '[1,2,3]')
        driver.emit("jsonkey" => '{"outer":{"inner":1}}')
      end
      expect( driver.filtered_as_array.map { |e| e.last } ).to eq([
          {"a" => 1},
          {"a" => 1},
          {"outer" => {"inner" => 1}},
        ])
    end
  end
end
