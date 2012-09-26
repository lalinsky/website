module Jekyll

  class DatePage < Page
    def initialize(site, base, dir, date, posts, name, layout)
      @site = site
      @base = base
      @dir = dir
      @name = name

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), layout)
      self.data['posts'] = posts

      date_title_prefix = site.config['date_title_prefix'] || 'Archive: '
      self.data['title'] = "#{date_title_prefix}#{date}"
    end
  end

  class DatePageGenerator < Generator
    safe true
    
    def generate(site)
      permalink = site.config['permalink'].split('/')
      for i in 2..permalink.length
        posts = {}
        dates = {}
        site.posts.each.each do |post|
          ignore = false
          date = []
          path = permalink[0,i].map do |part|
            case part
            when ':year'
              date << '%04d' % post.date.year
              date.last
            when ':month'
              date << '%02d' % post.date.month
              date.last
            when ':day'
              date << '%02d' % post.date.day
              date.last
            else
              if part.match(/^:/)
                ignore = true
              end
              part
            end
          end
          if not ignore
            dir = path.join("/")
            if posts.has_key?(dir)
              posts[dir] << post
            else
              posts[dir] = [post]
              dates[dir] = date.join('/')
            end
          end
        end
        posts.keys.sort.each do |dir|
          site.pages << DatePage.new(site, site.source, dir, dates[dir], posts[dir], 'index.html', 'date_index.html')
        end
      end
    end
  end

end
