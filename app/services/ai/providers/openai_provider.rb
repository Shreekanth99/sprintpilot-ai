module Ai
  module Providers
    class OpenaiProvider < BaseProvider
      def generate(prompt)
        client =
          OpenAI::Client.new(
            access_token:
              Rails.application.credentials.dig(
                :openai,
                :api_key
              )
          )

        response =
          client.chat(
            parameters: {
              model: "gpt-4o-mini",
              messages: [
                {
                  role: "user",
                  content: prompt
                }
              ]
            }
          )

        response.dig(
          "choices",
          0,
          "message",
          "content"
        )
      end
    end
  end
end
