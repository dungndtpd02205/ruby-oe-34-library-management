module BookHelper
  def show_category_name book
    cate_name = book.categories.name
    # Check category have parent category or not
    value_parent_id = book.categories.parent_id
    while value_parent_id.present?
      cate_parent = Categories.find_by id: value_parent_id
      cate_name += " - #{cate_parent.name}"
      value_parent_id = cate_parent.parent_id
      break unless value_parent_id

    end
    "#{t('activerecord.attributes.book.categories_id')} : #{cate_name}"
  end

  private

  def items
    [[t("book.index_attr.name"), Settings.book.name],
      [t("book.index_attr.author"), Settings.book.author],
      [t("book.index_attr.cate"), Settings.book.cate],
      [t("book.index_attr.publish"), Settings.book.publish]]
  end

  def show_attribute
    {
      Settings.book.name => t("activerecord.attributes.book.name"),
      Settings.book.publish => t("activerecord.attributes.book.publisher_id"),
      Settings.book.pub_day => t("activerecord.attributes.book.publish_day"),
      Settings.book.num_page => t("activerecord.attributes.book.num_of_pages")
    }
  end

  def show_value book
    {
      Settings.book.name => book.name,
      Settings.book.publish => book.publisher.name,
      Settings.book.pub_day => book.publish_day.strftime("%d/%m/%Y"),
      Settings.book.num_page => book.num_of_pages
    }
  end
end
