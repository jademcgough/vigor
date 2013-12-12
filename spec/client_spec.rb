describe Vigor::Client, :vcr do
  it "can find a summoner by name" do
    vigor = Vigor::Client.new(ENV["API_KEY"])
    summoner = vigor.summoner("semiel")
    summoner.id.should == 23893133
    summoner.name.should == "Semiel"
    summoner.profile_icon_id.should == 518
    summoner.level.should == 30
  end

  it "can find a summoner by id" do
    vigor = Vigor::Client.new(ENV["API_KEY"])
    summoner = vigor.summoner(23893133)
    summoner.id.should == 23893133
    summoner.name.should == "Semiel"
    summoner.profile_icon_id.should == 518
    summoner.level.should == 30
  end

  it "works on servers other than NA" do
    vigor = Vigor::Client.new(ENV["API_KEY"], "euw")
    summoner = vigor.summoner("Froggen")
    summoner.id.should == 19531813
    summoner.name.should == "Froggen"
    summoner.level.should == 30
  end

  it "can find summoners whose names have whitespace" do
    vigor = Vigor::Client.new(ENV["API_KEY"])
    summoner = vigor.summoner("Best Riven NA")
    summoner.id.should == 32400810
    summoner.name.should == "Best Riven NA"
    summoner.level.should == 30
  end
end
