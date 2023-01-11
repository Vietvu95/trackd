// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// Nav click
import { initClicknav } from "./plugins/navclick.js"

document.addEventListener('turbo:load', (e) => {
  console.log('turbo:load')
  initClicknav()
})
// End of Nav click
