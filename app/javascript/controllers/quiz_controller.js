import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // HTML側の data-quiz-target="input" を見つけるための設定
  static targets = ["input"]
// 画面に読み込まれた瞬間に動く
connect() {
    console.log("クイズコントローラーが連結されました！");
    alert("アプリが起動しました！"); // これが出ればJavaScriptは動いています
  }
  // 入力されたときに動く関数
  check(event) {
    const input = event.target
    if (input.value === input.dataset.correct) {
      confetti({ particleCount: 150 });
      input.disabled = true;
    }
  }

  // 正解したときの動き
  success(input) {
    // 星を飛ばす！
    confetti({
      particleCount: 150,
      spread: 70,
      origin: { y: 0.6 },
      colors: ['#ff9800', '#ffeb3b', '#ffffff']
    });

    input.disabled = true; // 入力できなくする
    input.style.backgroundColor = "#e8f5e9"; // 薄い緑色にする
  }

  // 間違えたときの動き
  fail(input) {
    input.classList.add("animate__animated", "animate__headShake"); // プルプル震わせる
    input.style.borderColor = "red";

    // 0.5秒後に元に戻す
    setTimeout(() => {
      input.classList.remove("animate__animated", "animate__headShake");
      input.style.borderColor = "#ff9800";
      input.value = ""; // 文字を消す
    }, 500);
  }
}