function userShow (){
  const user = document.getElementsByClassName("user");
  const users = Array.from(user);
  const userList = document.getElementById("user-list");

  users.forEach((user) => {
    user.addEventListener("mouseover", () => {
      userList.setAttribute("style", "display:block;");
    });

    user.addEventListener("mouseout", () => {
      userList.removeAttribute("style", "display:block;");
    });
  });
};

window.addEventListener("load", userShow);