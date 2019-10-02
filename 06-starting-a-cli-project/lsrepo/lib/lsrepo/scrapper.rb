
class Lsrepo::Scrapper

  # https://github.com/j-shilling?tab=repositories
  attr_accessor :url, :doc

  def initialize(username)
    self.url = "https://github.com/#{username}?tab=repositories"
    self.doc = Nokogiri::HTML(open(url))
  end

  def next_url
    btns = doc.css("div#user-repositories-list div.BtnGroup a")
    next_btn = btns.detect {|btn| btn.text.strip == "Next"}
    if next_btn
      next_btn.attribute('href').value
    else
      nil
    end
  end

  def repos
    # Keep track of repos
    results = []
    loop do
      # get current page
      results += doc.css("div#user-repositories-list li h3 a").map { |a| a.text.strip }

      # Is there a next page?
      new_url = next_url
      if new_url
        # if yes, open it
        self.doc = Nokogiri::HTML(open(new_url))
      else
        # if no, exit
        break
      end
    end
    results
  end

end
