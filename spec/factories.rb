Factory.define :user do |u|
  u.email "tester@harmony.heroku.com"
  u.password 'foobar'
end

Factory.define :account do |a| 
  a.name "Test Account Name"
end
 
Factory.define :todo do |t|
  t.task "Test this"
end
