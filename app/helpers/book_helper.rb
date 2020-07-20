module BookHelper
  def items
    [[t("book.index_attr.name"), Settings.book.name],
      [t("book.index_attr.author"), Settings.book.author],
      [t("book.index_attr.cate"), Settings.book.cate],
      [t("book.index_attr.publish"), Settings.book.publish]]
  end
end
