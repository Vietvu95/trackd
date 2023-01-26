import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="search-api"
export default class extends Controller {

  static targets = ["field"];

  connect() {
    console.log("search_api is here111")

      fetch(`https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=9da0f106-d8b3-4138-865c-09975e3c1f58`)
      .then((response) => response.document())
      .then(data => console.log(data))

      console.log("test this one")
    // Add auto complete
    // End add auto complete
  }

  submitSearch() {
    console.log("hello submit")
    const value = this.queryTarget.value
    console.log(value)
    // if (value) {
    //   fetch(`https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=${value}&CMC_PRO_API_KEY=5aa37e4d-a1ce-4f6e-8790-1dd89f569a5f`)
    //   .then((reponse) => response.text())
    //   .then(data => console.log(data))
    // }
  }
}
