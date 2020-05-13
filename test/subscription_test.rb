require_relative 'test_helper'

# SubscriptionLibraryTest.
# @class_description
#   Tests the SubscriptionLibrary class.
class SubscriptionLibraryTest < Minitest::Test

  # Constants.
  NILCLASS_I = nil
  TEST_FLOAT = 3.14
  TEST_SYMBOL = :test_symbol

  # test_conf_doc_f_ex().
  # @description
  #   The .travis.yml, CODE_OF_CONDUCT.md, Gemfile, LICENSE.txt, README.md,
  #   .yardopts, .gitignore, Changelog.md, CODE_OF_CONDUCT.md,
  #   subscription.gemspec, Gemfile.lock, and Rakefile files exist.
  def test_conf_doc_f_ex()
    
    assert_path_exists('.travis.yml')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('Gemfile')
    assert_path_exists('LICENSE.txt')
    assert_path_exists('README.md')
    assert_path_exists('.yardopts')
    assert_path_exists('.gitignore')
    assert_path_exists('Changelog.md')
    assert_path_exists('CODE_OF_CONDUCT.md')
    assert_path_exists('subscription.gemspec')
    assert_path_exists('Gemfile.lock')
    assert_path_exists('Rakefile')
  
  end

  # test_version_declared().
  # @description
  #   The version was declared.
  def test_version_declared()
    refute_nil(SubscriptionLibrary::VERSION)
  end

  # setup().
  # @description
  #   Set fixtures.
  def setup()
  end

  # Subscription.update(subject = nil).

  # test_cu_x1().
  # @description
  #   Integration test. 'subject' is a Node.
  def test_cu_x1()

    n1                = Node.new(NILCLASS_I, TEST_SYMBOL, NILCLASS_I)
    df_singleton      = DiagramFactory.instance()
    diagram           = df_singleton.diagram(n1)
    node_subscription = NodeSubscription.instance()
    node_subscription.add_publisher(n1)
    node_subscription.add_subscriber(n1, diagram)
    n2 = Node.new(NILCLASS_I, TEST_FLOAT, NILCLASS_I)
    n1.attach_back(n2)
    Subscription.update(n1)
    post_diagram = df_singleton.diagram(n1)
    refute_same(diagram, post_diagram)
    n1.detach_back()
    assert_same(diagram, df_singleton.diagram(n1))

  end

  # test_cu_x2().
  # @description
  #   Any object excluding subscribable instance types.
  def test_cu_x2()
    assert_raises(ArgumentError) { Subscription.update() }
  end
  
  # teardown().
  # @description
  #   Cleanup.
  def teardown()
  end
  
end
