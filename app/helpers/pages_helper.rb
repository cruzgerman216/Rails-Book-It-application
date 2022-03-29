module PagesHelper
  def eight_random_books
    count = Book.all.count
    books = []
    return books if count == 0

    if count < 8
      books = count.times.map { Book.all[Random.rand(count)] }
    else
      books = 8.times.map { Book.all[Random.rand(Book.count)] }
    end
    return books
  end
end
