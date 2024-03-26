import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  connect() {
    setInterval(this.reanimateSvg.bind(this), 2000);
  }

  reanimateSvg() {
    const svgElements = this.element.querySelectorAll(".reanimate-svg");
  
    svgElements.forEach((svgElement) => {
      // Generate a random delay between 0 and 2000 milliseconds (2 seconds)
      const randomDelay = Math.random() * 2000;
  
      // Reanimate the SVG element after the random delay
      setTimeout(() => {
        const imageUrl = svgElement.getAttribute("src");
        const newImageUrl = `${imageUrl.split("?")[0]}?t=${new Date().getTime()}`;
        svgElement.setAttribute("src", newImageUrl);
      }, randomDelay);
    });
  }
  
}