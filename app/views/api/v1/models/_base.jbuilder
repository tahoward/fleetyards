# encoding: utf-8
# frozen_string_literal: true

json.id model.id
json.name model.name
json.slug model.slug
json.description model.description
json.length model.display_length.to_f
json.beam model.display_beam.to_f
json.height model.display_height.to_f
json.mass model.display_mass.to_f
json.cargo model.display_cargo
json.net_cargo model.net_cargo
json.min_crew model.display_min_crew
json.max_crew model.display_max_crew
json.scm_speed model.display_scm_speed
json.afterburner_speed model.display_afterburner_speed
json.size model.size
json.store_image model.store_image.url
json.store_url store_url(model.store_url)
json.price model.price
json.on_sale model.on_sale
json.production_status model.production_status
json.production_note model.production_note
json.classification model.classification
json.focus model.focus
json.rsi_id model.rsi_id
