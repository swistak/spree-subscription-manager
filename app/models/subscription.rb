class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :mailing_list

  validates_format_of :email, :with => Format::EMAIL_REGEX, :allow_nil => true
  validates_uniqueness_of :email

  after_create :insert_to_php_list
  after_destroy :remove_from_php_list

  # insert subscriber into php list database
  def insert_to_php_list
    PhpList.create(self.email) 
  end

  # remove subscriber from php list database
  def remove_from_php_list
    PhpList.destroy(self.email)
  end
end
