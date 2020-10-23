# frozen_string_literal: true

require "test_helper"

class PrimerMenuComponentTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_renders_empty_menu
    render_inline(Primer::MenuComponent.new)

    assert_selector("nav.menu")
  end

  def test_renders_menu_items
    render_inline(Primer::MenuComponent.new) do |component|
      component.slot(:item, href: "#url", label: "foo")
      component.slot(:item, href: "#url", label: "bar", selected: true)
    end

    assert_selector(".menu-item", text: "foo")
    assert_selector(".menu-item[aria-current='page']", text: "bar")
  end

  def test_renders_menu_heading
    render_inline(Primer::MenuComponent.new) do |component|
      component.slot(:heading, id: "abc") { "Heading" }
    end

    assert_selector(".menu-heading", text: "Heading")

    # Assert aria-labelledby is applied to menu when a heading is applied
    assert_selector("nav[aria-labelledby='abc'] .menu-heading#abc", text: "Heading")
  end
end
