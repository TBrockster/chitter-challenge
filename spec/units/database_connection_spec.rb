require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_peeps_test')

      DatabaseConnection.setup('chitter_peeps_test')
    end
  end
  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_peeps_test')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
