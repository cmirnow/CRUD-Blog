xml.instruct!
xml.rss version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title 'Blog on Rails'
    xml.description 'CRUD Blog on Rails. Geo-Targeted Banner Ads. Visitor analytics. Tags.'
    xml.link root_url
    xml.language 'ru-ru'
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: 'https://mstp.herokuapp.com/feed.rss'

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link post_url(post)
        xml.pubDate(post.created_at.rfc2822)
        xml.guid post_url(post)
        xml.description(h(post.text))
      end
    end
  end
end
