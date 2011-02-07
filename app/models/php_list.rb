require 'md5'

class PhpList < ActiveRecord::Base
  establish_connection(
        :adapter  => "mysql",
        :host     => "localhost",
        :username => "phplist",
        :password => "do3Aepho",
        :database => "phplist"
      )

  def self.create email
    srand()
    uniq_id = MD5.md5("#{rand()}_#{rand()}_#{Time.now.to_i}").to_s

    begin
      a = self.connection.insert_sql("INSERT into phplist_user_user set email = '#{email}',
      entered = now(), password = NULL,disabled = 0,confirmed = 1, uniqid = '#{uniq_id}',htmlemail = 0")
      self.connection.insert("INSERT into phplist_listuser set userid = #{a}, listid = 3, entered = now()")
      true
    rescue
      false
    end
  end

  def self.destroy email
    begin
      a = self.connection.select_one("select id from phplist_user_user where email like '#{email}'")
      self.connection.delete("delete from phplist_user_user where email like '#{email}'")
      self.connection.delete("delete from phplist_listuser where userid = #{a['id']}")
      true
    rescue
      false
    end
  end
end
