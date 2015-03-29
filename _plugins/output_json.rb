# encoding: utf-8
#
# Title:
# ======
# Jekyll to JSON Generator
#
# Description:
# ============
# A plugin for generating JSON representations of your
# site content for easy use with JS MVC frameworks like Backbone.
#
# Author:
# ======
# Jezen Thomas
# jezenthomas@gmail.com
# http://jezenthomas.com

module Jekyll
    require 'json'
    require 'yaml'

    module ApiGenerator
        class JSONGenerator < Jekyll::Generator
            safe true
            priority :low

            def generate(site)

                cwd = File.dirname(__FILE__)
                Jekyll.logger.info "API Generator:", 'Creating api files...'
                # Converter for .md > .html
                converter = site.getConverterImpl(Jekyll::Converters::Markdown)

                Jekyll.logger.debug  'Deleting existing directory'
                base_path = '../assets/api/v1.0'
                abs_path = File.join(site.dest, base_path)
                FileUtils.rm_rf(abs_path)

                # Iterate over all posts
                site.posts.each do |post|
                    # Encode the HTML to JSON
                    title = post.title.downcase.tr(' ', '-').delete("’!")

                    path_parts = post.url.split('/')

                    filename = path_parts.pop
                    filename << '.json'

                    path = File.join(abs_path, path_parts)

                    # Create the directories from the path
                    FileUtils.mkpath(path) unless File.exists?(path)

                    # Create the JSON file and inject the data

                    f = File.new("#{path}/#{filename}", "w+")
                    Jekyll.logger.debug  "API Generator:", "Created: " + File.realdirpath(f.path) #{f.absolute_path}"
                    post.content = converter.convert(post.content)
                    hash = {
                        "header" => post.data,
                        "title" => post.title,
                        "date" => post.date,
                        "categories" => post.categories,
                        "content" => converter.convert(post.content),
                    }

                    f.puts JSON.pretty_generate(hash)
                    f.close
                end
            end
        end
    end
end