---
title: Menu
---

The menu is a vertical list of navigational links.

## Examples

### Default

<iframe style="width: 100%; border: 0px; height: 175px;" srcdoc="<html><head><link href='https://unpkg.com/@primer/css/dist/primer.css' rel='stylesheet'></head><body><nav aria-labelledby='menu-heading' class='menu '>    <span id='menu-heading' class='menu-heading '>      Heading</span>    <a href='#url' class='menu-item '>      Account</a>    <a aria-current='page' href='#url' class='menu-item '>      Profile</a>    <a href='#url' class='menu-item '>      Emails</a></nav></body></html>"></iframe>

```erb
<%= render(Primer::MenuComponent.new) do |component| %>
  <% component.slot(:heading) { "Heading" } %>
  <% component.slot(:item, href: "#url", label: "Account") %>
  <% component.slot(:item, href: "#url", label: "Profile", selected: true) %>
  <% component.slot(:item, href: "#url", label: "Emails") %>
<% end %>
```

## Arguments

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `kwargs` | `Hash` | N/A | [Style arguments](/style-arguments) |

### `heading` slot

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `kwargs` | `Hash` | N/A | [Style arguments](/style-arguments) |

### `item` slot

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `label` | `String` | N/A | Text to display for item. |
| `href` | `String` | N/A | Url the item should link to. |
| `icon` | `String` | N/A | Name of Octicon icon to use. |
| `selected` | `Boolean` | `false` | Whether the item is the current page. |
| `kwargs` | `Hash` | N/A | [Style arguments](/style-arguments) |
