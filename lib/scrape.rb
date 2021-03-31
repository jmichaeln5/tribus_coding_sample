module Scrape
  def get_site(site)
    @html_doc = Nokogiri::HTML(Net::HTTP.get(URI(@site.link)))
    @site.title = @html_doc.title
    @site.thumbnail_link = "https://img.youtube.com/vi/#{@site.link.delete_prefix('https://www.youtube.com/watch?v=')}/0.jpg"
    @site.keyword_list = @html_doc.at('meta[name="keywords"]').values[1]
    @site.save
  end
end
