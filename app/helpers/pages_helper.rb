module PagesHelper
    def eight_random_books 
        return 8.times.map { Book.all[Random.rand(Book.count)] } 
    end
end
