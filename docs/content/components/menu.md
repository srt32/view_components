---
title: Menu
---

The menu is a vertical list of navigational links.

## Examples

### Default

<iframe style="width: 100%; border: 0px; height: 135px;" srcdoc="<html><head><link href='https://unpkg.com/@primer/css/dist/primer.css' rel='stylesheet'></head><body><nav class='menu '>    <a href='#url' class='menu-item '>      <svg class='octicon octicon-tools' height='16' viewBox='0 0 16 16' version='1.1' width='16' aria-hidden='true'><path fill-rule='evenodd' d='M5.433 2.304A4.494 4.494 0 003.5 6c0 1.598.832 3.002 2.09 3.802.518.328.929.923.902 1.64v.008l-.164 3.337a.75.75 0 11-1.498-.073l.163-3.33c.002-.085-.05-.216-.207-.316A5.996 5.996 0 012 6a5.994 5.994 0 012.567-4.92 1.482 1.482 0 011.673-.04c.462.296.76.827.76 1.423v2.82c0 .082.041.16.11.206l.75.51a.25.25 0 00.28 0l.75-.51A.25.25 0 009 5.282V2.463c0-.596.298-1.127.76-1.423a1.482 1.482 0 011.673.04A5.994 5.994 0 0114 6a5.996 5.996 0 01-2.786 5.068c-.157.1-.209.23-.207.315l.163 3.33a.75.75 0 11-1.498.074l-.164-3.345c-.027-.717.384-1.312.902-1.64A4.496 4.496 0 0012.5 6a4.494 4.494 0 00-1.933-3.696c-.024.017-.067.067-.067.16v2.818a1.75 1.75 0 01-.767 1.448l-.75.51a1.75 1.75 0 01-1.966 0l-.75-.51A1.75 1.75 0 015.5 5.282V2.463c0-.092-.043-.142-.067-.159zm.01-.005z'></path></svg>      Account</a>    <a aria-current='page' href='#url' class='menu-item '>      <svg class='octicon octicon-person' height='16' viewBox='0 0 16 16' version='1.1' width='16' aria-hidden='true'><path fill-rule='evenodd' d='M10.5 5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zm.061 3.073a4 4 0 10-5.123 0 6.004 6.004 0 00-3.431 5.142.75.75 0 001.498.07 4.5 4.5 0 018.99 0 .75.75 0 101.498-.07 6.005 6.005 0 00-3.432-5.142z'></path></svg>      Profile</a>    <a href='#url' class='menu-item '>      <svg class='octicon octicon-mail' height='16' viewBox='0 0 16 16' version='1.1' width='16' aria-hidden='true'><path fill-rule='evenodd' d='M1.75 2A1.75 1.75 0 000 3.75v.736a.75.75 0 000 .027v7.737C0 13.216.784 14 1.75 14h12.5A1.75 1.75 0 0016 12.25v-8.5A1.75 1.75 0 0014.25 2H1.75zM14.5 4.07v-.32a.25.25 0 00-.25-.25H1.75a.25.25 0 00-.25.25v.32L8 7.88l6.5-3.81zm-13 1.74v6.441c0 .138.112.25.25.25h12.5a.25.25 0 00.25-.25V5.809L8.38 9.397a.75.75 0 01-.76 0L1.5 5.809z'></path></svg>      Emails</a></nav></body></html>"></iframe>

```erb
<%= render(Primer::MenuComponent.new) do |component| %>
  <% component.slot(:item, href: "#url", label: "Account", icon: "tools") %>
  <% component.slot(:item, href: "#url", label: "Profile", icon: "person", selected: true) %>
  <% component.slot(:item, href: "#url", label: "Emails", icon: "mail") %>
<% end %>
```

### With heading

<iframe style="width: 100%; border: 0px; height: 175px;" srcdoc="<html><head><link href='https://unpkg.com/@primer/css/dist/primer.css' rel='stylesheet'></head><body><nav aria-labelledby='menu-heading' class='menu '>    <span id='menu-heading' class='menu-heading '>      Heading</span>    <a href='#url' class='menu-item '>            Account</a>    <a aria-current='page' href='#url' class='menu-item '>            Profile</a>    <a href='#url' class='menu-item '>            Emails</a></nav></body></html>"></iframe>

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
| `icon` | `String` | `nil` | Name of Octicon icon to use. |
| `selected` | `Boolean` | `false` | Whether the item is the current page. |
| `kwargs` | `Hash` | N/A | [Style arguments](/style-arguments) |
