import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  selectLink(event) {
    event.preventDefault();
    var links = document.getElementsByClassName("btn-topic"); // Select all links within the controller's element
    var clickedLink = event.currentTarget;

    for (const link of links) {
      if (link === clickedLink) {
        link.classList.add("selected-navbar");
      } else {
        link.classList.remove("selected-navbar");
      }
    }

  }
}
