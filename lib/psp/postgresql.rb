# coding: utf-8

module Psp
  module Postgresql
    include Output
    include Ascii

    extend self

    def version
      return @pg_version if defined?(@pg_version)

      MutexPool[:postgresql].synchronize do
        return @pg_version if defined?(@pg_version)

        debug { puts "Gathering #{green 'PostgreSQL'} version" }
        @pg_version = %x{$(which psql) --version}.match(/\d+\.\d+/)[0].to_f

        debug { puts "Postgresql version is #{green @pg_version}" }
        @pg_version
      end
    end
  end # module Postgresql
end # module Psp

