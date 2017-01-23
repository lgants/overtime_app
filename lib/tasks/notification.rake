# creates custom rake task
namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    # 1. schedule to run at Sunday
    # 2. iterate over all employees
    # 3. skip AdminUsers
    # 4. send a sms message that has instructions and a link
    User.all.each do |user|
      SmsTool.send_sms()
    end
  end

end
