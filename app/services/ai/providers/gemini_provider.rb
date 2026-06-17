module Ai
  module Providers
    class GeminiProvider
      def generate(prompt)
        response =
          HTTParty.post(
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent",
            query: {
              key: ENV["GEMINI_API_KEY"]
            },
            headers: {
              "Content-Type" => "application/json"
            },
            body: {
              contents: [
                {
                  parts: [
                    {
                      text: prompt
                    }
                  ]
                }
              ]
            }.to_json
          )

        parsed = response.parsed_response

        if parsed["error"].present?

          return <<~MSG
            Gemini API Error

            Code: #{parsed["error"]["code"]}

            Message:
            #{parsed["error"]["message"]}
          MSG

        end

        parsed
          .dig(
            "candidates",
            0,
            "content",
            "parts",
            0,
            "text"
          )

      rescue StandardError => e

        "Gemini Error: #{e.message}"
      end
    end
  end
end
