Rails.application.routes.draw do
#  this is like "resources :periodictask" but it has been
#  replaced put with match for action 'update', allowing both http-verb options 'put'
#  and the new verb 'patch' for compatibility with Redmine 3 and below

  match    'projects/:project_id/periodictasks/customfields', :to => 'periodictasks#customfields', :as => 'periodictask_customfields', :via => [:post, :patch]
  get      'projects/:project_id/periodictasks',            :to => 'periodictasks#index',  :as => 'periodictasks'
  get      'projects/:project_id/periodictasks/new',        :to => 'periodictasks#new',    :as => 'new_periodictask'
  post     'projects/:project_id/periodictasks',            :to => 'periodictasks#create'
  get      'projects/:project_id/periodictasks/:id',        :to => 'periodictasks#show',   :as => 'periodictask'
  get      'projects/:project_id/periodictasks/:id/edit',   :to => 'periodictasks#edit',   :as => 'edit_periodictask'
  match    'projects/:project_id/periodictasks/:id',        :to => 'periodictasks#update', :via => [:put, :patch]
  delete   'projects/:project_id/periodictasks/:id',        :to => 'periodictasks#destroy'

end
