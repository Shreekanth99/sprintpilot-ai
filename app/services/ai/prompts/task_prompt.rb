module Ai
  module Prompts
    class TaskPrompt
      def self.build(story)
        <<~PROMPT
          You are a Senior Agile Scrum Master.

          Break the following story into
          development tasks.

          Story:
          #{story}

          Return:

          - Task Name
          - Description
          - Estimated Hours
        PROMPT
      end
    end
  end
end
