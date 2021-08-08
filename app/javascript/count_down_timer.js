function countDownTimer (){
  const startBtn = document.getElementById("begin-workout-btn");
  const finishBtn = document.getElementById("finish-workout-btn");
  const routineLength = Number(document.getElementById("routine-length").innerText);
  let actionNum = 1;

  startBtn.addEventListener("click", () => {
    startBtn.setAttribute("class", "hidden");

    function startTimer (){
      const workoutContent = document.getElementById(`workout-content${actionNum}`);
      const currentStateElement = document.getElementById(`current-state${actionNum}`);
      const timeElement = document.getElementById(`workout-time${actionNum}`);
      const setCountElement = document.getElementById(`workout-set-count${actionNum}`);
      const restElement = document.getElementById(`workout-rest${actionNum}`);
      const workoutTime = Number(timeElement.innerText);
      const workoutSetCount = Number(setCountElement.innerText);
      const workoutRest = Number(restElement.innerText);
      let lastTime = workoutTime;
      let lastRest = workoutRest;
      let lastSetCount = workoutSetCount;

      const countDown = () => {
        lastTime -= 1;
        timeElement.innerText = lastTime;
      };

      const restDown = () => {
        lastRest -= 1;
        restElement.innerText = lastRest;
      }

      const setCountDown = () => {
        lastSetCount -= 1;
        setCountElement.innerText = lastSetCount;
      };

      // タイマー機能開始
      const clearCountDown = setInterval(() => {
        // ワークアウトのタイムをカウントダウン
        countDown();
        
        // ワークアウトのタイムが0になれば実行
        if (lastTime == 0){
          // ワークアウトのタイムのカウントダウンを停止
          clearInterval(clearCountDown);
          // (始)WorkoutとRestの文字を入れ替え
          timeElement.classList.add("hidden");
          currentStateElement.innerText = "Rest";
          currentStateElement.setAttribute("style", "color:#005FFF;")
          restElement.classList.remove("hidden");
          // (終)WorkoutとRestの文字を入れ替え

          // 休憩時間(Rest)をカウントダウン
          const clearRestDown = setInterval(() => {
            restDown();

            // 休憩時間が0になれば実行
            if (lastRest == 0){
              // 休憩時間のカウントダウンを停止
              clearInterval(clearRestDown);

              // (始)RestとWorkoutの文字を入れ替え
              timeElement.classList.remove("hidden");
              currentStateElement.innerText = "Workout";
              currentStateElement.removeAttribute("style", "color:#005FFF;")
              restElement.classList.add("hidden");
              // (終)RestとWorkoutの文字を入れ替え

              // セット数を-1する
              setCountDown();
              
              // セット数が0になれば実行
              if (lastSetCount == 0 ){
                // カウントダウンをしていたメニューを隠し次のメニューを一番上に表示させる
                workoutContent.classList.add("hidden")
                // メニューの番号を+1する
                actionNum++;
                
                // すべてのメニューのカウントダウンを完了すれば実行
                if (actionNum > routineLength){
                  // 終了ボタンを表示させる
                  finishBtn.classList.remove("hidden");
                  return;
                };

                // 次のメニューのカウントダウンを開始
                startTimer();
                // これより下の処理をさせないためにreturnする
                return;
              }

              // (始)ワークアウトと休憩の時間が0のままなので初期値に戻す
              lastTime = workoutTime;
              lastRest = workoutRest;
              timeElement.innerText = lastTime;
              restElement.innerText = lastRest;
              // (終)ワークアウトと休憩の時間が0のままなので初期値に戻す

              // 再び同じメニュのカウントダウンを開始
              startTimer();
            };

          }, 1000);
        };

      }, 1000);
    };

    startTimer();
  
  });
};

window.addEventListener("load", countDownTimer);