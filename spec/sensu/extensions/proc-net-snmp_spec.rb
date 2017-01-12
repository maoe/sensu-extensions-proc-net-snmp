require "spec_helper"

describe Sensu::Extension::ProcNetSNMP do
  include Helpers

  before do
    @extension = Sensu::Extension::ProcNetSNMP.new
    @extension.logger = logger
    @extension.settings = settings
  end

  it 'can collect metrics in /proc/net/snmp' do
    async_wrapper do
      @extension.safe_run do |output, status|
        expect(output).to be_kind_of(String)
        expect(output).to match('[^ ]+ \d+ \d+')
        async_done
      end
    end
  end
end
