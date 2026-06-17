module Ai
  class Assistant
    def self.generate(prompt, generation_type)
      case generation_type

      when "story"

        Ai::Client.provider.generate(
          story_prompt(prompt)
        )

      when "task"

        Ai::Client.provider.generate(
          task_prompt(prompt)
        )

      when "epic"

        Ai::Client.provider.generate(
          epic_prompt(prompt)
        )

      when "sprint"

        Ai::Client.provider.generate(
          sprint_prompt(prompt)
        )

      else

        "Please select a generation type."

      end
    end

    private

    def self.story_prompt(prompt)
      <<~PROMPT
        Generate:

        Title
        User Story
        Acceptance Criteria
        Story Points

        Requirement:

        #{prompt}
      PROMPT
    end

    def self.task_prompt(prompt)
      <<~PROMPT
        Break the following requirement
        into development tasks.

        Requirement:

        #{prompt}

        Return only bullet points.
      PROMPT
    end

    def self.epic_prompt(prompt)
      <<~PROMPT
        Generate agile epics.

        Requirement:

        #{prompt}
      PROMPT
    end

    def self.sprint_prompt(prompt)
      <<~PROMPT
        Generate sprint plan.

        Requirement:

        #{prompt}
      PROMPT
    end
  end
end
