module ApplicationHelper

  def full_title(page_title = '')
    base_title = 'Chordex'
    if page_title.empty?
      base_title + ' | コード進行から曲を検索'
    else
      page_title + ' | ' + base_title
    end
  end
end
