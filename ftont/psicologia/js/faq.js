document.addEventListener("DOMContentLoaded", function () {
  const faqItems = document.querySelectorAll(".faq-item");

  faqItems.forEach(item => {
    const answer = item.querySelector(".faq-answer");
    const toggle = item.querySelector(".faq-toggle");

    item.addEventListener("click", () => {
      const isOpen = item.classList.contains("opened");

      // Fecha todos os itens
      faqItems.forEach(otherItem => {
        otherItem.classList.remove("opened");
        otherItem.querySelector(".faq-answer").style.display = "none";
        otherItem.querySelector(".faq-toggle").textContent = "+";
      });

      // Abre o item atual se estava fechado
      if (!isOpen) {
        item.classList.add("opened");
        answer.style.display = "block";
        toggle.textContent = "−";
      }
    });
  });
});
