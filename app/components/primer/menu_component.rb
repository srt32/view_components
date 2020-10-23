# frozen_string_literal: true

module Primer
  # Primer CSS comes with several navigation components. Some were designed with singular purposes, while others were design to be more flexible and appear quite frequently.
  class MenuComponent < Primer::Component
    include ViewComponent::Slotable

    with_slot :heading, class_name: "Heading"
    with_slot :item, collection: true, class_name: "Item"

    def initialize(**kwargs)
      @kwargs = kwargs
      @kwargs[:tag] = :nav
      @kwargs[:classes] = class_names(
        kwargs[:classes],
        "menu"
      )
    end

    def before_render
      @kwargs['aria-labelledby'] = "menu-heading" if heading.present?
    end

    class Heading < Primer::Slot
      attr_reader :kwargs

      def initialize(**kwargs)
        @kwargs = kwargs
        @kwargs[:id] = "menu-heading"
        @kwargs[:tag] ||= :span
        @kwargs[:classes] = class_names(
          kwargs[:classes],
          "menu-heading"
        )
      end
    end

    class Item < Primer::Slot
      attr_reader :label, :href, :kwargs

      def initialize(label:, href:, selected: false, **kwargs)
        @label = label

        @kwargs = kwargs
        @kwargs['aria-current'] = "page" if selected
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
