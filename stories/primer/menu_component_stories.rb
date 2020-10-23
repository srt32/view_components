# frozen_string_literal: true

class Primer::MenuComponentStories < ViewComponent::Storybook::Stories
  layout "storybook_preview"

  story(:menu) do
    content do |component|
      component.slot(:heading) { "Heading" }
      component.slot(:item, href: "#url", icon: "tools", label: "Item one")
      component.slot(:item, href: "#url", icon: "person", label: "Item two")
      component.slot(:item, href: "#url", icon: "mail", label: "Item three")
    end
  end
end
