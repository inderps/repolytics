class Repo
  include Her::Model
  uses_api $github
  collection_path "/user/repos"
end