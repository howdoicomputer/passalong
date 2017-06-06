namespace :infra do
  task :plan do
    Dir.chdir('./infra') do
      sh 'geo apply'
    end
  end
end

namespace :frontend do
  task :build do
    Dir.chdir('./passalong-front') do
      sh 'yarn build'
    end
  end

  task :deploy do
    Dir.chdir('./passalong-front') do
      sh 'yarn build'
      sh 'yarn run publish'
    end
  end
end

namespace :backend do
  task :provision do
    Dir.chdir('./passalong-back') do
      sh 'zappa deploy dev'
    end
  end

  task :deploy do
    Dir.chdir('./passalong-back') do
      sh 'zappa update dev'
    end
  end
end
