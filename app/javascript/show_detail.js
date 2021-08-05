function showDetail(){
  const detailBtnCollection = document.getElementsByClassName("detail");
  const detailBtnArray = Array.from(detailBtnCollection)
  detailBtnArray.forEach((detailBtn) => {
    detailBtn.addEventListener("click", () => {
      const parent = detailBtn.parentNode;
      const routineDetail = parent.nextElementSibling;
      if(routineDetail.classList.contains("hidden")){
        routineDetail.classList.remove("hidden");
        detailBtn.innerText = "詳細▲"
      }else{
        routineDetail.classList.add("hidden");
        detailBtn.innerText = "詳細▼"
      }
    });
  });
};
window.addEventListener("load", showDetail);