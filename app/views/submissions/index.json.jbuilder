json.array!(@submissions) do |submission|
  json.extract! project, :user, :id
  json.url course_project_url(course, project, format: :json)
end
