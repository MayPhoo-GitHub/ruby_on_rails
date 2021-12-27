class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates_inclusion_of :public_flag, :in => [true, false]

    # function :to_csv
    # export post list csv
    # @return [<Type>] <cvs>
    def self.to_csv
      headers = Constants::POST_CSV_HEADER
      CSV.generate(headers: true) do |csv|
        csv << headers
        all.each do |post|
          csv << headers.map{ |attr| post.send(attr) }
        end
      end
    end


    # function import
    # import post csv
    # @param [<Type>] file <description>
    # @param [<Type>] current_user_id <description>
    # @return [<Type>] <description>
    def self.import(file,current_user_id)
      begin
        CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8', row_sep: :auto, header_converters: :symbol) do |row|
          Post.create! row.to_hash.merge(created_user_id: current_user_id, updated_user_id: current_user_id, created_at: Time.now, updated_at: Time.now)
        end
        return true
      rescue => exception
        return exception
      end
    end
end
