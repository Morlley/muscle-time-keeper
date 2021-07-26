function moveMonth (){
  const monthInput = document.getElementById("input-move");
  const moveMonthForm = document.getElementById("move-month-form");

  const toLastMonth = document.getElementById("to-last-month");
  toLastMonth.addEventListener("click", () => {
    monthInput.value--;
    moveMonthForm.submit();
  });

  const toNextMonth = document.getElementById("to-next-month");
  toNextMonth.addEventListener("click", () => {
    monthInput.value++;
    moveMonthForm.submit();
  });

  const today = document.getElementById("move-today");
  today.addEventListener("click",() => {
    monthInput.value = 0;
    moveMonthForm.submit();
  });
};

window.addEventListener("load", moveMonth);
