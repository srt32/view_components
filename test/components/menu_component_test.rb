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
      component.slot(:item, href: "#url", label: "bar")
    end

    assert_selector(".menu-item", text: "foo")
    assert_selector(".menu-item", text: "bar")
  end
end
