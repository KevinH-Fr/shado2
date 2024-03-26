# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.2.0/dist/chart.js", preload: false
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.2


pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"

pin "jquery", to: "jquery.min.js", preload: false
pin "jquery_ujs", to: "jquery_ujs.js", preload: false
