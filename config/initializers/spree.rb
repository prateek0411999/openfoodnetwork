# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'

require 'spree/product_filters'
require 'spree/core/calculated_adjustments_decorator'

require "#{Rails.root}/app/models/spree/payment_method_decorator"
require "#{Rails.root}/app/models/spree/gateway_decorator"

Spree.config do |config|
  config.shipping_instructions = true
  config.address_requires_state = true

  # -- spree_paypal_express
  # Auto-capture payments. Without this option, payments must be manually captured in the paypal interface.
  config.auto_capture = true
  #config.override_actionmailer_config = false
end

# TODO Work out why this is necessary
# Seems like classes within OFN module become 'uninitialized' when server reloads
# unless the empty module is explicity 'registered' here. Something to do with autoloading?
module OpenFoodNetwork
end
