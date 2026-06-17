module Ai
  class TaskGenerator
    def self.generate(story)
      prompt =
        Ai::Prompts::TaskPrompt.build(
          story
        )

      Ai::Client
        .provider
        .generate(prompt)
    end
  end
end
