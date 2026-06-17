module Ai
  module Providers
    class MockProvider < BaseProvider
      def generate(prompt)
        <<~TEXT
          MOCK AI RESPONSE

          Prompt:
          #{prompt}

          Story Points: 5
        TEXT
      end
    end
  end
end
