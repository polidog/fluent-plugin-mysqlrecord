module Fluent

  class MysqlRecordOutput < Fluent::BufferedOutput
    Fluent::Plugin.register_output('mysqlrecord', self)

    include Fluent::SetTimeKeyMixin
    include Fluent::SetTagKeyMixin

    config_param :host, :string
    config_param :port, :integer, :default => nil
    config_param :database, :string
    config_param :username, :string
    config_param :password, :string, :default => '', :secret => true

    config_param :table, :string, :default => nil

    attr_accessor :handler

    def initialize
      super
      require 'mysql2-cs-bind'
    end

    def configure(conf)
      super
    end

    def start
      super
    end

    def shutdown
      super
    end

    def client
      Mysql2::Client.new({
          :host => @host, :port => @port,
          :username => @username, :password => @password,
          :database => @database, :flags => Mysql2::Client::MULTI_STATEMENTS,
        })
    end

    def write(chunk)
      handler = self.client
      chunk.msgpack_each { |tag, time, data|
        cols = data.keys.join(",")
        placeholders = data.map{|k| '?'}.join(',')
        sql = "INSERT INTO #{@table} (#{cols}) VALUES (#{placeholders})"
        handler.xquery(sql, data)
      }
      handler.close
    end

  end
end
