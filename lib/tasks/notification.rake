# creates custom rake tasks
namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    # 1. schedule to run at Sunday
    # 2. iterate over all employees
    # 3. skip AdminUsers
    # 4. send a sms message that has instructions and a link
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
