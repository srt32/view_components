---
title: Popover
status: Alpha
source: https://github.com/primer/view_components/tree/main/app/components/primer/popover_component.rb
storybook: https://primer.style/view-components/stories/?path=/story/primer-popover-component
---

import Example from '../../src/@primer/gatsby-theme-doctocat/components/example'

<!-- Warning: AUTO-GENERATED file, do not edit. Add code comments to your Ruby instead <3 -->

Use popovers to bring attention to specific user interface elements, typically to suggest an action or to guide users through a new experience.

By default, the popover renders with absolute positioning, meaning it should usually be wrapped in an element with a relative position in order to be positioned properly. To render the popover with relative positioning, use the relative property.

## Examples

### Default

<Example src="<div class='Popover position-relative right-0 left-0'></div>" />

```erb
<%= render Primer::PopoverComponent.new do |component| %>
  <% component.heading do %>
    Activity feed
  <% end %>
  <% component.body do %>
    This is the Popover body.
  <% end %>
<% end %>
```

### Large

<Example src="<div class='Popover position-relative right-0 left-0'></div>" />

```erb
<%= render Primer::PopoverComponent.new do |component| %>
  <% component.heading do %>
    Activity feed
  <% end %>
  <% component.body(large: true) do %>
    This is the large Popover body.
  <% end %>
<% end %>
```

### Caret position

<Example src="<div class='Popover position-relative right-0 left-0'></div>" />

```erb
<%= render Primer::PopoverComponent.new do |component| %>
  <% component.heading do %>
    Activity feed
  <% end %>
  <% component.body(caret: :left) do %>
    This is the large Popover body.
  <% end %>
<% end %>
```

## Arguments

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

## Slots

### `Heading`

The heading

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

### `Body`

The body

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `caret` | `Symbol` | N/A | One of `:top`, `:bottom`, `:bottom_right`, `:bottom_left`, `:left`, `:left_bottom`, `:left_top`, `:right`, `:right_bottom`, `:right_top`, `:top_left`, or `:top_right`. |
| `large` | `Boolean` | N/A | Whether to use the large version of the component. |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |
