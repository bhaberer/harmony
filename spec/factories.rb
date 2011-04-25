Factory.define :user do |u|
  u.email "harmony.application+tester@gmail.com"
  u.password 'foobar'
end

Factory.define :account do |a| 
  a.name "Test Account Name"
end
 
Factory.define :todo do |t|
  t.account { |todo| todo.association(:account) }
  t.task "Test this"
end
