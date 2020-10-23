# frozen_string_literal: true

module Primer
  # The menu is a vertical list of navigational links.
  class MenuComponent < Primer::Component
    include ViewComponent::Slotable

    with_slot :heading, class_name: "Heading"
    with_slot :item, collection: true, class_name: "Item"

    # @example 175|Default
    #   <%= render(Primer::MenuComponent.new) do |component| %>
    #     <% component.slot(:heading) { "Heading" } %>
    #     <% component.slot(:item, href: "#url", label: "Account") %>
    #     <% component.slot(:item, href: "#url", label: "Profile", selected: true) %>
    #     <% component.slot(:item, href: "#url", label: "Emails") %>
    #   <% end %>
    #
    # @param kwargs [Hash] <%= link_to_style_arguments_docs %>
    def initialize(**kwargs)
      @kwargs = kwargs
      @kwargs[:tag] = :nav
      @kwargs[:classes] = class_names(
        kwargs[:classes],
        "menu"
      )
    end

    def before_render
      @kwargs['aria-labelledby'] = heading.kwargs[:id] if heading.present?
    end

    class Heading < Primer::Slot
      attr_reader :kwargs

      # @param kwargs [Hash] <%= link_to_style_arguments_docs %>
      def initialize(**kwargs)
        @kwargs = kwargs
        @kwargs[:id] ||= "menu-heading"
        @kwargs[:tag] ||= :span
        @kwargs[:classes] = class_names(
          kwargs[:classes],
          "menu-heading"
        )
      end
    end

    class Item < Primer::Slot
      attr_reader :label, :href, :kwargs

      # @param label [String] Text to display for item.
      # @param href [String] Url the item should link to.
      # @param selected [Boolean] Whether the item is the current page.
      # @param kwargs [Hash] <%= link_to_style_arguments_docs %>
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
