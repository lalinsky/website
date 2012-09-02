module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category, name, layout)
      @site = site
      @base = base
      @dir = dir
      @name = name

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), layout)
      self.data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      category_name = site.config['category_names'][category]
      self.data['title'] = "#{category_title_prefix}#{category_name}"
    end
  end

  class CategoryPageGenerator < Generator
    safe true
    
    def generate(site)
      dir = site.config['category_dir'] || 'categories'
      site.categories.keys.each do |category|
        site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category, 'index.html', 'category_index.html')
        site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category, 'feed.xml', 'category_feed.xml')
      end
    end
  end

end
