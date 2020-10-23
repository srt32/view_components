# frozen_string_literal: true

module Primer
  # Primer CSS comes with several navigation components. Some were designed with singular purposes, while others were design to be more flexible and appear quite frequently.
  class MenuComponent < Primer::Component
    include ViewComponent::Slotable

    with_slot :item, collection: true, class_name: "Item"

    def initialize(**kwargs)
      @kwargs = kwargs
      @kwargs[:tag] = :nav
      @kwargs[:classes] = class_names(
        kwargs[:classes],
        "menu"
      )
    end

    class Item < Primer::Slot
      attr_reader :label, :href, :kwargs

      def initialize(label:, href:, **kwargs)
        @label = label

        @kwargs = kwargs
        @kwargs[:tag] = :a
        @kwargs[:href] = href
        @kwargs[:classes] = class_names(
          kwargs[:classes],
          "menu-item"
        )
      end
    end
  end
end
