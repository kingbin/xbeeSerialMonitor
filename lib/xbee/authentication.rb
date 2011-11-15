module XBee
  # @private
  module Authentication
    private

    def authentication
      {
        :host => host,
        :db => db,
        :user => user,
        :pass => pass
      }
    end

    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      authentication.values.all?
    end
  end
end
