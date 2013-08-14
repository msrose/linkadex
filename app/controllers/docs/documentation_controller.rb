class Docs::DocumentationController < ApplicationController
  def index
    @title = 'Documentation - Linkadex'
  end

  def getting_started
    @title = 'Getting Started - Linkadex'
  end

  def creating_links
    @title = 'Creating Links - Linkadex'
  end

  def features
    @title = 'Features - Linkadex'
  end
end
