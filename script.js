// Waits until the page is loaded before running our code
document.addEventListener("DOMContentLoaded", function () {
  // Get elements from the HTML by their ID
  var toggleHoursBtn = document.getElementById("toggleHoursBtn");
  var hoursTable = document.getElementById("hoursTable");
  var liveTime = document.getElementById("liveTime");
  var backToTop = document.getElementById("backToTop");

  // Show/Hide opening hours
  function updateHoursButtonText() {
    if (!toggleHoursBtn || !hoursTable) {
      return;
    }

    if (hoursTable.style.display === "none") {
      toggleHoursBtn.textContent = "Show Opening Hours";
    } else {
      toggleHoursBtn.textContent = "Hide Opening Hours";
    }
  }

  if (toggleHoursBtn && hoursTable) {
    // Set a nicer button label on page load
    updateHoursButtonText();

    toggleHoursBtn.addEventListener("click", function () {
      // If the table is hidden, show it. If it is showing, hide it.
      if (hoursTable.style.display === "none") {
        hoursTable.style.display = "table";
      } else {
        hoursTable.style.display = "none";
      }

      updateHoursButtonText();
    });
  }

  // Live date and time (updates every second)
  if (liveTime) {
    function updateLiveTime() {
      var now = new Date();

      // Use Mauritius locale + time zone for consistent formatting
      try {
        liveTime.textContent = now.toLocaleString("en-MU", {
          timeZone: "Indian/Mauritius",
        });
      } catch (e) {
        liveTime.textContent = now.toLocaleString();
      }
    }

    // Run once straight away, then every second
    updateLiveTime();
    setInterval(updateLiveTime, 1000);
  }

  // Back-to-top button
  if (backToTop) {
    function checkScrollPosition() {
      // pageYOffset is the number of pixels the page has been scrolled
      if (window.pageYOffset > 300) {
        backToTop.style.display = "block";
      } else {
        backToTop.style.display = "none";
      }
    }

    // When the user scrolls, check if we should show the button
    window.addEventListener("scroll", checkScrollPosition);

    // When the button is clicked, scroll back to the top
    backToTop.addEventListener("click", function () {
      // Smooth scroll is supported in modern browsers
      window.scrollTo({ top: 0, behavior: "smooth" });
    });

    // Run once at the start
    checkScrollPosition();
  }

  // Highlight a section when it is clicked
  var cards = document.getElementsByClassName("card");

  for (var i = 0; i < cards.length; i++) {
    cards[i].addEventListener("click", function () {
      // Remove highlight from all cards first
      for (var j = 0; j < cards.length; j++) {
        cards[j].classList.remove("card-highlight");
      }

      // Add highlight to the clicked card
      this.classList.add("card-highlight");
    });
  }
});
