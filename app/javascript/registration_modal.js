function displayModal(){
  const registration = document.getElementById("display-registration-modal");
  registration.addEventListener("click", () => {
    $("#registration-modal").fadeIn();
  });

  const closeModal = document.getElementById("close-modal")
  closeModal.addEventListener("click", () => {
    $("#registration-modal").fadeOut();
  });
};

window.addEventListener("load", displayModal);