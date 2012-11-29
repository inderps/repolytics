class Story
  attr_accessor :number, :repo, :owner, :token

  def initialize hash
    hash.each do |k,v|
      self.instance_variable_set("@#{k}", v)
    end
  end

  def committers
    commits = Commit.all(:access_token => @token, :_owner => @owner, :_repo => @repo)
    messages = commits.collect(&:commit).collect{ |commit| commit[:message] }.select{ |msg| msg.include?("##{@number}") }
    committers = Committer.all
    committer_hash = []
    committers.each do |committer|
      no_of_commits = get_no_of_commits(committer, messages)
      next if no_of_commits == 0
      committer_hash << {
            :committer => committer,
            :no_of_commits => no_of_commits
      }
    end
    committer_hash
  end

  private
  def get_no_of_commits committer, messages
    messages.select{ |msg| msg.include?(committer.name) }.count
  end
end