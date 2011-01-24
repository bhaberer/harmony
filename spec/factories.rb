Factory.define :user do |u|
  u.email "tester@umloud.org"
  u.password 'foobar'
end

Factory.define :account do |a| 
  a.name "Test Account Name"
end
 

