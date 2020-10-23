# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "yard"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

YARD::Rake::YardocTask.new

namespace :coverage do
  task :report do
    require "simplecov"
    require "simplecov-console"

    SimpleCov.minimum_coverage 100

    SimpleCov.collate Dir["simplecov-resultset-*/.resultset.json"], "rails" do
      formatter SimpleCov::Formatter::Console
    end
  end
end

namespace :docs do
  task :livereload do
    require "listen"

    Rake::Task["docs:build"].execute

    puts "Listening for changes to documentation..."

    listener = Listen.to("app") do |modified, added, removed|
      puts "modified absolute path: #{modified}"
      puts "added absolute path: #{added}"
      puts "removed absolute path: #{removed}"

      Rake::Task["docs:build"].execute
    end
    listener.start # not blocking
    sleep
  end

  def one_of(enumerable)
    "One of #{enumerable.map { |k| "`#{k.nil? ? 'nil' : ":#{k}"}`" }.to_sentence(last_word_connector: ', or ')}."
  end

  def link_to_style_arguments_docs
    "[Style arguments](/style-arguments)"
  end

  task :build do
    require File.expand_path("../demo/config/environment.rb", __FILE__)
    require "primer/view_components"
    require "view_component/test_helpers"
    include ViewComponent::TestHelpers

    puts "Building YARD documentation."
    Rake::Task["yard"].execute

    puts "Converting YARD documentation to Markdown files."

    # Rails controller for rendering arbitrary ERB
    view_context = ApplicationController.new.tap { |c| c.request = ActionDispatch::TestRequest.create }.view_context

    registry = YARD::RegistryStore.new
    registry.load!(".yardoc")
    components = [
      Primer::AvatarComponent,
      Primer::BaseComponent,
      Primer::BlankslateComponent,
      Primer::BorderBoxComponent,
      Primer::BoxComponent,
      Primer::BreadcrumbComponent,
      Primer::ButtonComponent,
      Primer::CounterComponent,
      Primer::FlashComponent,
      Primer::LabelComponent,
      Primer::LayoutComponent,
      Primer::LinkComponent,
      Primer::MenuComponent,
      Primer::OcticonComponent,
      Primer::PopoverComponent,
      Primer::ProgressBarComponent,
      Primer::StateComponent,
      Primer::SpinnerComponent,
      Primer::SubheadComponent,
      Primer::TextComponent,
      Primer::TimelineItemComponent
    ]
    components.each do |component|
      documentation = registry.get(component.name)

      # Primer::AvatarComponent => Avatar
      short_name = component.name.demodulize.gsub("Component", "")

      File.open("docs/content/components/#{short_name.downcase}.md", "w") do |f|
        f.puts("---")
        f.puts("title: #{short_name}")
        f.puts("---")
        f.puts
        f.puts(view_context.render(inline: documentation.base_docstring))
        f.puts

        initialize_method = documentation.meths.find(&:constructor?)

        if initialize_method.tags(:example).any?
          f.puts("## Examples")
          f.puts
        end

        initialize_method.tags(:example).each do |tag|
          iframe_height = tag.name.split("|").first
          name = tag.name.split("|")[1]
          description = tag.name.split("|")[2]

          f.puts("### #{name}")
          if description
            f.puts
            f.puts(description)
          end
          f.puts
          html = view_context.render(inline: tag.text)

          f.puts("<iframe style=\"width: 100%; border: 0px; height: #{iframe_height}px;\" srcdoc=\"<html><head><link href=\'https://unpkg.com/@primer/css/dist/primer.css\' rel=\'stylesheet\'></head><body>#{html.gsub("\"", "\'").gsub("\n", "")}</body></html>\"></iframe>")
          f.puts
          f.puts("```erb")
          f.puts("#{tag.text}")
          f.puts("```")
          f.puts
        end

        f.puts("## Arguments")
        f.puts
        f.puts("| Name | Type | Default | Description |")
        f.puts("| :- | :- | :- | :- |")

        initialize_method.tags(:param).each do |tag|
          params = tag.object.parameters.find { |param| [tag.name.to_s, tag.name.to_s + ":"].include?(param[0]) }

          default =
            if params && params[1]
              "`#{params[1]}`"
            else
              "N/A"
            end

          f.puts("| `#{tag.name}` | `#{tag.types.join(", ")}` | #{default} | #{view_context.render(inline: tag.text)} |")
        end

        component.slots.each do |name, value|
          slot_documentation = registry.get("#{component.name}::#{value[:class_name]}")

          if slot_documentation
            slot_initialize_method = slot_documentation.meths.find(&:constructor?)

            f.puts
            f.puts("### `#{name}` slot")
            f.puts
            f.puts("| Name | Type | Default | Description |")
            f.puts("| :- | :- | :- | :- |")

            slot_initialize_method.tags(:param).each do |tag|
              params = tag.object.parameters.find { |param| [tag.name.to_s, tag.name.to_s + ":"].include?(param[0]) }

              default =
                if params && params[1]
                  "`#{params[1]}`"
                else
                  "N/A"
                end

              f.puts("| `#{tag.name}` | `#{tag.types.join(", ")}` | #{default} | #{view_context.render(inline: tag.text)} |")
            end

            if slot_documentation.base_docstring.present?
              f.puts
              f.puts(slot_documentation.base_docstring)
            end
          end
        end
      end
    end

    puts "Markdown compiled."
  end
end

task default: :test
