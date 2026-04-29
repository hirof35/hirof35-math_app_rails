# app/models/user.rb
class User < ApplicationRecord
    has_many :study_records
  
    def add_exp(amount)
      self.exp += amount
      new_level = (exp / 100) + 1
      leveled_up = new_level > self.level
      self.level = new_level
      save
      leveled_up
    end
  
    def character_image
      # レベルに応じてたまご→スライム→騎士に進化
      return "egg.png" if level < 3
      return "slime.png" if level < 7
      "knight.png"
    end
  end
  
  # app/models/drill.rb
  class Drill < ApplicationRecord
    def generate_questions(count = 10)
      Array.new(count) do
        num1 = rand(1..9)
        num2 = rand(1..9)
        # 九九かたし算かをタイトルで判定する簡易版
        operator = title.include?("かけざん") ? "×" : "+"
        answer = operator == "×" ? num1 * num2 : num1 + num2
        { n1: num1, n2: num2, op: operator, ans: answer }
      end
    end
  end