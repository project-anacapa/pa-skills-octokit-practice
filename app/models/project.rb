class Submissions

  def initialize(repo, access_token)
    @repo  = repo
    @access_token = access_token
  end


  def all
    github = Octokit::Client.new(:access_token => @access_token)
    branch = github.branch(@repo, "master")
    logger = Logger.new(STDOUT)
    tree = github.tree(@repo, branch.commit.sha, :recursive => true)
    # user/id/json
    results = tree.tree.select{|f| f.path =~ /.*\/.*\/json/ }
    results.map do|f|
      element = f.path.split("/")
      logger.info(element)

      Submission.new(element[0], element[1])
    end
    #tree.tree.find(|f| f.file=='users')

  end
end


class Project < ActiveRecord::Base
  belongs_to :course
  def submissions
    Submissions.new(repo, access_token)
  end
end
