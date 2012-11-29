class Commit
  include Her::Model
  uses_api $github
  collection_path "/repos/:owner/:repo/commits"
end