require 'chefspec'

describe 'script::run_script' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'runs a script with the default action' do
    expect(chef_run).to run_script('default_action')
    expect(chef_run).to_not run_script('not_default_action')
  end

  it 'runs a script with an explicit action' do
    expect(chef_run).to run_script('explicit_action')
  end

  it 'runs a script with attributes' do
    expect(chef_run).to run_script('with_attributes').with(creates: 'creates')
    expect(chef_run).to_not run_script('with_attributes').with(creates: 'bacon')
  end

  it 'runs a script when specifying the identity attribute' do
    expect(chef_run).to run_script('identity_attribute')
  end
end
