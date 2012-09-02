module Jekyll

  class TagPage < Page
    def initialize(site, base, dir, tag, name, layout)
      @site = site
      @base = base
      @dir = dir
      @name = name

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), layout)
      self.data['tag'] = tag

      tag_title_prefix = site.config['tag_title_prefix'] || 'Tag: '
      self.data['title'] = "#{tag_title_prefix}#{tag}"
    end
  end

  class TagPageGenerator < Generator
    safe true
    
    def generate(site)
      dir = site.config['tag_dir'] || 'tags'
      site.tags.keys.each do |tag|
        site.pages << TagPage.new(site, site.source, File.join(dir, tag), tag, 'index.html', 'tag_index.html')
        site.pages << TagPage.new(site, site.source, File.join(dir, tag), tag, 'feed.xml', 'tag_feed.xml')
      end
    end
  end

end
