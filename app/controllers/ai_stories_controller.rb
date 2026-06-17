class AiStoriesController < ApplicationController
  layout "dashboard"

  def index
  end

  def generate
    session[:epic_id] =
      params[:epic_id]

    @result =
      Ai::StoryGenerator.generate(
        params[:feature]
      )

    session[:generated_story] =
      @result

    respond_to do |format|
      format.turbo_stream
      format.html { render :index }
    end
  end

  def save_story
    generated_story =
      session[:generated_story]

    epic_id =
      session[:epic_id]

    unless generated_story.present?

      redirect_to ai_stories_path,
                  alert: "Generate a story first."

      return

    end

    title =
      generated_story
        .match(/## Title\s*(.*?)\s*## User Story/m)
        &.captures
        &.first
        &.strip

    user_story =
      generated_story
        .match(/## User Story\s*(.*?)\s*## Acceptance Criteria/m)
        &.captures
        &.first
        &.strip

    story_points =
      generated_story
        .match(/## Story Points\s*(\d+)/)
        &.captures
        &.first

    Story.create!(
      title: title.presence || "AI Generated Story",
      description: user_story.presence || generated_story,
      story_points: story_points || 5,
      epic_id: epic_id,
      status: "todo"
    )

    session.delete(:generated_story)
    session.delete(:epic_id)

    redirect_to stories_path,
                notice: "Story saved successfully."

  rescue StandardError => e

    redirect_to ai_stories_path,
                alert: e.message
  end
end
