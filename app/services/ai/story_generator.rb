module Ai
  class StoryGenerator
    def self.generate(feature)
      prompt =
        Prompts::StoryPrompt.build(
          feature
        )

      Client.provider.generate(
        prompt
      )

    rescue StandardError => e

      "Error: #{e.message}"
    end
  end
end
