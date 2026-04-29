Rails.application.routes.draw do
  # おまけ：もし以前に drills コントローラーを作っていたら
  # resources :drills
  
  # トップページを drills コントローラーの index アクションにする（後で作ります）
  root "drills#index"
end