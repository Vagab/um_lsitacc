class CentralOrganization < User
  USERS = [User.first, User.second]

  def process_request(content)
    id = content.split(' ')[1].to_i - 1
    action = content.split(' ')[0]
    if USERS.map(&:permission)[id].include? action
      amount = content.split(' ').last.to_i
      if USERS.map(&:balance)[id] >= amount
        USERS[id].update!(balance: USERS[id].balance - amount)
        if action == 'ADD'
          USERS[content.split(' ')[2].to_i - 1].update!(balance: USERS[content.split(' ')[2].to_i - 1].balance + amount)
        end
      else
        'not enough balance'
      end
    else
      'no permission'
    end
  end

  def user_balances
    USERS.map(&:balance).join(', ')
  end
end
