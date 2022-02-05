# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'jquery', to: 'https://code.jquery.com/jquery-3.6.0.min.js', preload: true
pin 'react', to: 'https://ga.jspm.io/npm:react@17.0.2/index.js'
pin 'object-assign', to: 'https://ga.jspm.io/npm:object-assign@4.1.1/index.js'
pin 'scheduler', to: 'https://ga.jspm.io/npm:scheduler@0.20.2/index.js'
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.2/lib/index.js"
