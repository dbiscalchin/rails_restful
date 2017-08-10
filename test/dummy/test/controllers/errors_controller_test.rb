require 'test_helper'

class ErrorsControllerTest < ActiveSupport::TestCase
  # TODO: Check translations
  setup do
    @controller = ErrorsController.new
  end

  test 'raise method passing error key' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, :not_found
    end
  end

  test 'raise method passing error key and message' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, :not_found, 'message'
    end
    assert_equal 'message', error.message
  end

  test 'raise method passing error key, message and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, :not_found, 'message', translate: false
    end
    assert_equal 'message', error.message
  end

  test 'raise method passing error key and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, :not_found, translate: false
    end
  end

  test 'raise method passing error class' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound
    end
  end

  test 'raise method passing error class and message' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound, 'message'
    end
    assert_equal 'message', error.message
  end

  test 'raise method passing error class, message and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound, 'message', translate: false
    end
    assert_equal 'message', error.message
  end

  test 'raise method passing error class and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound, translate: false
    end
  end

  test 'raise method passing error object' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound.new
    end
  end

  test 'raise method passing error object with message' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound.new('message')
    end
    assert_equal 'message', error.message
  end

  test 'raise method passing error object with message and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound.new('message', translate: false)
    end
    assert_equal 'message', error.message
  end

  test 'raise method passing error object with option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :raise, RailsRestful::Errors::NotFound.new(translate: false)
    end
  end

  test 'raise method with no parameters' do
    error = assert_raises(RuntimeError) do
      @controller.send :raise
    end
  end

  test 'raise method passing a non API exception class' do
    error = assert_raises(KeyError) do
      @controller.send :raise, KeyError
    end
  end

  test 'raise method passing a non API exception class and message' do
    error = assert_raises(KeyError) do
      @controller.send :raise, KeyError, 'message'
    end
    assert_equal 'message', error.message
  end

  test 'raise method passing a non API exception' do
    error = assert_raises(KeyError) do
      @controller.send :raise, KeyError.new
    end
  end

  test 'raise method passing a non API exception with message' do
    error = assert_raises(KeyError) do
      @controller.send :raise, KeyError.new('message')
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing error key' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, :not_found
    end
  end

  test 'fail method passing error key and message' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, :not_found, 'message'
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing error key, message and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, :not_found, 'message', translate: false
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing error key and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, :not_found, translate: false
    end
  end

  test 'fail method passing error class' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound
    end
  end

  test 'fail method passing error class and message' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound, 'message'
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing error class, message and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound, 'message', translate: false
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing error class and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound, translate: false
    end
  end

  test 'fail method passing error object' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound.new
    end
  end

  test 'fail method passing error object with message' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound.new('message')
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing error object with message and option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound.new('message', translate: false)
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing error object with option' do
    error = assert_raises(RailsRestful::Errors::NotFound) do
      @controller.send :fail, RailsRestful::Errors::NotFound.new(translate: false)
    end
  end

  test 'fail method with no parameters' do
    error = assert_raises(RuntimeError) do
      @controller.send :fail
    end
  end

  test 'fail method passing a non API exception class' do
    error = assert_raises(KeyError) do
      @controller.send :fail, KeyError
    end
  end

  test 'fail method passing a non API exception class and message' do
    error = assert_raises(KeyError) do
      @controller.send :fail, KeyError, 'message'
    end
    assert_equal 'message', error.message
  end

  test 'fail method passing a non API exception' do
    error = assert_raises(KeyError) do
      @controller.send :fail, KeyError.new
    end
  end

  test 'fail method passing a non API exception with message' do
    error = assert_raises(KeyError) do
      @controller.send :fail, KeyError.new('message')
    end
    assert_equal 'message', error.message
  end
end
