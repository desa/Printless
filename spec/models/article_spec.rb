require 'spec_helper'

describe Article do

  before do
    user = User.create(name: "Example user", email: "example@example.com",
                        password: "example", password_confirmation: "example")
    @article = Article.create(title: "Lorem", content: "Lorem ipsum", user_id: user.id)
  end

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @aricle.user_id = nil }
    it { should_not be_valid }
  end
end