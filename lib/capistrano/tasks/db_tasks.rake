# https://coderwall.com/p/1ikwgq/writing-custom-tasks-for-capistrano-3
# use: cap production custom:run_db_task
namespace :custom do
  desc 'run some rake db task'
  task :run_db_task do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: "#{fetch(:stage)}" do
          execute :rake, "db:create"
        end
      end
    end
  end
end

