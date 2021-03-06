require 'redmine'

Rails.configuration.to_prepare do
  unless Project.included_modules.include? RedminePeriodictask::ProjectPatch
    Project.send(:include, RedminePeriodictask::ProjectPatch)
  end
end

Redmine::Plugin.register :periodictask do
  name 'Redmine Periodictask plugin'
  author 'Julian Perelli'
  description 'Plugin to create a task periodically by defining an interval'
  version '3.3.1'
  url 'https://github.com/jperelli/Redmine-Periodic-Task/'
  author_url 'https://jperelli.com.ar/'

  project_module :periodictask do
    permission :periodictask, {:periodictasks => [:index, :edit]}
  end

  menu :project_menu, :periodictask, { :controller => 'periodictasks', :action => 'index' }, :caption => :label_periodictask, :after => :settings, :param => :project_id
end
