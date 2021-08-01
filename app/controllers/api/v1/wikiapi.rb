module API
  module V1
    class Wikiapi < Grape::API
      include API::V1::Defaults

      require 'wikipedia'

      desc "Return Request"
      params do
        requires :search, type: String, desc: "wiki lookup param"
      end
      get ":search" do
        page = Wikipedia.find(params[:search])
        fullurl = page.fullurl
        summary = page.summary
        images = page.image_urls

        { fullurl: fullurl, summary: summary, images: images }

      end
    end
  end
end
