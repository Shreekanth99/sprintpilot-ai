module Ai
  module Providers
    class ClaudeProvider < BaseProvider
      def generate(prompt)
        response =
          HTTParty.post(
            "https://api.anthropic.com/v1/messages",
            headers: {
              "x-api-key" =>
                Rails.application.credentials.dig(
                  :claude,
                  :api_key
                ),
              "anthropic-version" => "2023-06-01",
              "Content-Type" => "application/json"
            },
            body: {
              model: "claude-sonnet-4",
              max_tokens: 2000,
              messages: [
                {
                  role: "user",
                  content: prompt
                }
              ]
            }.to_json
          )

        response.parsed_response
          .dig("content", 0, "text")
      end
    end
  end
end
