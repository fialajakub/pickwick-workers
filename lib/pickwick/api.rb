# TODO: Write ruby API client
#
module Pickwick
  module API

    class Error < Exception; end

    class Response
      def initialize(response)
        @response = response
      end

      def body
        @body ||= MultiJson.load(@response.body, symbolize_keys: true)
      end

      def status
        @response.status
      end
    end

    def self.url
      ENV['PICKWICK_API_URL']   || "http://localhost:9292"
    end

    def self.token
      ENV['PICKWICK_API_TOKEN'] || "de59c6ce8359c815f11146e473183ad8e7affe42"
    end

    def store(documents)
      Response.new(Faraday.post(__store_url, token: token, payload: __store_payload([documents].flatten)))
    end

    def get(*ids)
      Response.new(Faraday.post(__bulk_url, token: token, ids: Array(ids).flatten))
    end

    def __store_url
      url + "/vacancies"
    end

    def __bulk_url
      url + "/vacancies/bulk"
    end

    def __store_payload(documents)
      documents.map { |document| MultiJson.dump(document) }.join("\n")
    end

    extend self
  end
end
