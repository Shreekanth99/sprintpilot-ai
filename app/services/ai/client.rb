module Ai
  class Client
    def self.provider
      provider =
        ENV.fetch(
          "AI_PROVIDER",
          "mock"
        )

      case provider

      when "openai"
        Providers::OpenaiProvider.new

      when "gemini"
        Providers::GeminiProvider.new

      when "claude"
        Providers::ClaudeProvider.new

      when "deepseek"
        Providers::DeepseekProvider.new

      when "ollama"
        Providers::OllamaProvider.new

      else
        Providers::MockProvider.new

      end
    end
  end
end
