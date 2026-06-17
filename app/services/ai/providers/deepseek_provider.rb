module Ai
  module Providers
    class DeepseekProvider < BaseProvider
      def generate(prompt)
        response =
          HTTParty.post(
            "https://api.deepseek.com/chat/completions",
            headers: {
              "Authorization" =>
                "Bearer #{Rails.application.credentials.dig(:deepseek, :api_key)}",
              "Content-Type" =>
                "application/json"
            },
            body: {
              model: "deepseek-chat",
              messages: [
                {
                  role: "user",
                  content: prompt
                }
              ]
            }.to_json
          )

        response.parsed_response
          .dig(
            "choices",
            0,
            "message",
            "content"
          )
      end
    end
  end
end
