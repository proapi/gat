Rails.application.routes.draw do

  scope module: 'api' do
    scope module: 'v1' do
      get 'locations/:country_code', to: 'public#locations'
      get 'target_groups/:country_code', to: 'public#target_groups'

      namespace :private do
        get 'locations/:country_code', to: 'private#locations'
        get 'target_groups/:country_code', to: 'private#target_groups'
        post 'evaluate_target', to: 'private#evaluate_target'
      end
     end
  end

end
