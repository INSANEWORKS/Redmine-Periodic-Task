module PeriodictasksHelper

  def checklistPluginInstalled?
    return Redmine::Plugin.all.any? {|p| p.id == :redmine_checklists} && Object.const_defined?('ChecklistTemplate')
  end

  def template_options_for_select(project = nil, selected_id = nil)
    scoped = ChecklistTemplate.visible
    scoped = scoped.in_project_and_global(project) if project.present?
    templates = scoped.eager_load(:category).to_a
    without_category = templates.select{ |x| x.category.nil? }.map{ |x| [x.name, x.id, {'data-template-items' => x.template_items}] }
    with_category = templates.select{ |x| x.category }
    options_for_select(
      [[l(:label_select_template), '']] + without_category,
      :selected => selected_id
    ) +
    grouped_options_for_select(
        with_category.group_by{ |x| x.category.try(:name) }.
        map{ |k,v| [ k, v.map{ |x| [ x.name, x.id, {'data-template-items' => x.template_items} ] } ] },
        :selected => selected_id
    )
  end

end
