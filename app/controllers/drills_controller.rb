# app/controllers/drills_controller.rb
# app/controllers/drills_controller.rb
class DrillsController < ApplicationController
    def index
      # ここは空でも大丈夫です。Railsが自動的に app/views/drills/index.html.erb を探します。
    end
    def show
        @drill = Drill.find(params[:id])
        @questions = @drill.generate_questions(5) # プロトタイプなので5問
    end
end
