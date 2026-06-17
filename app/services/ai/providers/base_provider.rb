module Ai
  module Providers
    class BaseProvider
      def generate(_prompt)
        raise NotImplementedError
      end
    end
  end
end
