class Instructor < ApplicationRecord
    has_many :students

    def average_age 
        total_age = self.students.map {|student| student.age}.sum
        (total_age.to_f / self.students.length).round(2)
    end 
end
