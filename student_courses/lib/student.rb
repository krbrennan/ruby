

class Student
  attr_accessor :courses, :first_name, :last_name

    def initialize(first_name,last_name)
      @first_name = first_name
      @last_name = last_name
      @courses = []
    end

    def name
      "#{@first_name} #{@last_name}"
    end

    def enroll(new_course)
      if courses.any?{|course| course.conflicts_with?(new_course)}
        raise "errorrr"
      end

      if courses.include?(new_course)
        return "error"
      else
        courses << new_course
        new_course.students << self
      end
    end

    def course_load
      solution = Hash.new(0)
      courses.each do |course|
        solution[course.department] += course.credits
      end
      solution
    end

end
