set :application, 'my_app_name'

set :repo_url, 'https://github.com/thinkAmi/ringo-tabetter.git'
set :deploy_to, '/home/vagrant/ringo_tabetter'
set :scm, :git

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:ringo) do
      within current_path do
        execute :rake, 'db:migrate'

        # seed内で画面入力が必要だったりするので、今回はコメントアウトしておく
        # execute :rake, 'db:seed'

        # 外部からアクセスできるように、 -h オプションを付ける
        # デーモン化するため、 -d オプションを付ける
        # 必要に応じて、 -p オプションでポートを指定しておく
        execute :bundle, :exec, 'padrino s -d -h 0.0.0.0'
      end
    end
  end

  after :restart, :clear_cache do
  end

  after :finishing, 'deploy:cleanup'

end
