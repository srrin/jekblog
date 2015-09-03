# Generate pages from individual records in yml files
# (c) 2014 Adolfo Villafiorita
# Distributed under the conditions of the MIT License

module Jekyll

  class DataPage < Page
    def initialize(site, base, dir, data, name, template, drname)
      @site = site
      @base = base
      #@dir = dir
      @name = sanitize_filename(data[name]) + ".html"

      @dir = data[drname]
      
      if data['template']
        template = data['template']
      end
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), template + ".html")
      self.data.merge!(data)
      self.data['title'] = data[name]
    end


    private

    # copied from Jekyll
    def sanitize_filename(name)
      name = name.gsub(/[^\w\s_-]+/, '')
      name = name.gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
      name = name.gsub(/\s+/, '_')
    end
  end

  class IndexPage < Page
    def initialize(site, base, data,  drname)
      @site = site
      @base = base
      @name = "index.html"
      @dir = data[drname]

      self.process(@name)
      self.read_yaml(File.join(base,'_layouts'),"pagelist.html")
      #self.data.merge!(data)
      self.data['title'] = 'index'
    end
  end


  class DataPagesGenerator < Generator
    safe true

    def generate(site)
      data = site.config['page_gen']
      if data
        data.each do |data_spec|
          # todo: check input data correctness
          template = data_spec['template'] || data_spec['data']
          name = data_spec['name']
          dir = data_spec['dir'] || data_spec['data']
          
          dname = data_spec['drname']
          #puts dname

          if site.layouts.key? template
            records =  site.data[data_spec['data']]
            
            records.each do |record|
              site.pages << IndexPage.new(site,site.source,record,dname)
              site.pages << DataPage.new(site, site.source, dir, record, name, template,dname)
            end
          else
            puts "error. could not find #{data_file}" if not File.exists?(data_file)
            puts "error. could not find template #{template}" if not site.layouts.key? template
          end
        end
      end
    end
  end

  module DataPageLinkGenerator
    # use it like this: {{input | datapage_url: dir}}
    # output: dir / input .html
    def datapage_url(input, dir)
      dir + "/" + sanitize_filename(input) + ".html"
    end

    private

    # copied from Jekyll
    def sanitize_filename(name)
      name = name.gsub(/[^\w\s_-]+/, '')
      name = name.gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
      name = name.gsub(/\s+/, '_')
    end
  end

end

Liquid::Template.register_filter(Jekyll::DataPageLinkGenerator)

