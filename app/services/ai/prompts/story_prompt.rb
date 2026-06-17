module Ai
  module Prompts
    class StoryPrompt
      def self.build(feature)
        <<~PROMPT
          You are a Senior Agile Product Owner.

          Generate a professional Agile User Story
          for the following feature:

          FEATURE:
          #{feature}

          Return the response using EXACTLY
          the following format:

          ## Title

          ## User Story

          As a <user>

          I want <goal>

          So that <benefit>

          ## Acceptance Criteria

          - criteria 1
          - criteria 2
          - criteria 3

          ## Story Points

          Estimate story points using the
          Fibonacci scale:

          1, 2, 3, 5, 8, 13

          ## Technical Notes

          Include implementation considerations.

          Keep the response concise,
          professional and backlog-ready.
        PROMPT
      end
    end
  end
end
