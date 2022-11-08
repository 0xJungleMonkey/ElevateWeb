class Elevator < ApplicationRecord
  include ActiveModel::Dirty

  belongs_to :column

  require 'slack-notifier'

  oldstatus = ''
  before_update do
    oldstatus = self.Status_was
  end

  after_update do


    if oldstatus != self.Status


      notifier = Slack::Notifier.new ENV["slackwebhook"]
      notifier.ping "The Elevator #{id} with Serial Number #{self.SerialNumber} changed status from #{oldstatus} to #{self.Status}"
    end
  end
end
