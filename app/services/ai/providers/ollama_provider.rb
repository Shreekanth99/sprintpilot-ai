module Ai
  module Providers
    class OllamaProvider < BaseProvider
      def generate(prompt)
        response =
          HTTParty.post(
            "http://localhost:11434/api/generate",
            headers: {
              "Content-Type" => "application/json"
            },
            body: {
              model: "llama3",
              prompt: prompt,
              stream: false
            }.to_json
          )

        response.parsed_response["response"]
      end
    end
  end
end
