json.array!(@projects) do |project|
  json.extract! project, :id, :name, :repo, :access_token, :course
  json.url course_project_url(course, project, format: :json)
end
