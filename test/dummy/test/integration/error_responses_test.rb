require 'test_helper'

class ErrorResponsesTest < ActionDispatch::IntegrationTest
  test 'bad request' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'bad_request' }
    assert_match /"status":400/, response.body
    assert_match /"message":"Bad request"/, response.body
    assert_response 400
  end

  test 'unauthorized' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'unauthorized' }
    assert_match /"status":401/, response.body
    assert_match /"message":"Unauthorized"/, response.body
    assert_response 401
  end

  test 'payment required' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'payment_required' }
    assert_match /"status":402/, response.body
    assert_match /"message":"Payment required"/, response.body
    assert_response 402
  end

  test 'forbidden' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'forbidden' }
    assert_match /"status":403/, response.body
    assert_match /"message":"Forbidden"/, response.body
    assert_response 403
  end

  test 'not found' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'not_found' }
    assert_match /"status":404/, response.body
    assert_match /"message":"Not found"/, response.body
    assert_response 404
  end

  test 'method not allowed' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'method_not_allowed' }
    assert_match /"status":405/, response.body
    assert_match /"message":"Method not allowed"/, response.body
    assert_response 405
  end

  test 'not acceptable' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'not_acceptable' }
    assert_match /"status":406/, response.body
    assert_match /"message":"Not acceptable"/, response.body
    assert_response 406
  end

  test 'proxy authentication required' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'proxy_authentication_required' }
    assert_match /"status":407/, response.body
    assert_match /"message":"Proxy authentication required"/, response.body
    assert_response 407
  end

  test 'request timeout' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'request_timeout' }
    assert_match /"status":408/, response.body
    assert_match /"message":"Request timeout"/, response.body
    assert_response 408
  end

  test 'conflict' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'conflict' }
    assert_match /"status":409/, response.body
    assert_match /"message":"Conflict"/, response.body
    assert_response 409
  end

  test 'gone' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'gone' }
    assert_match /"status":410/, response.body
    assert_match /"message":"Gone"/, response.body
    assert_response 410
  end

  test 'length required' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'length_required' }
    assert_match /"status":411/, response.body
    assert_match /"message":"Length required"/, response.body
    assert_response 411
  end

  test 'precondition failed' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'precondition_failed' }
    assert_match /"status":412/, response.body
    assert_match /"message":"Precondition failed"/, response.body
    assert_response 412
  end

  test 'unsupported media type' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'unsupported_media_type' }
    assert_match /"status":415/, response.body
    assert_match /"message":"Unsupported media type"/, response.body
    assert_response 415
  end

  test 'expectation failed' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'expectation_failed' }
    assert_match /"status":417/, response.body
    assert_match /"message":"Expectation failed"/, response.body
    assert_response 417
  end

  test 'unprocessable entity' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'unprocessable_entity' }
    assert_match /"status":422/, response.body
    assert_match /"message":"Unprocessable entity"/, response.body
    assert_response 422
  end

  test 'locked' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'locked' }
    assert_match /"status":423/, response.body
    assert_match /"message":"Locked"/, response.body
    assert_response 423
  end

  test 'failed dependency' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'failed_dependency' }
    assert_match /"status":424/, response.body
    assert_match /"message":"Failed dependency"/, response.body
    assert_response 424
  end

  test 'upgrade required' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'upgrade_required' }
    assert_match /"status":426/, response.body
    assert_match /"message":"Upgrade required"/, response.body
    assert_response 426
  end

  test 'internal server error' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'internal_server_error' }
    assert_match /"status":500/, response.body
    assert_match /"message":"Internal server error"/, response.body
    assert_response 500
  end

  test 'not implemented' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'not_implemented' }
    assert_match /"status":501/, response.body
    assert_match /"message":"Not implemented"/, response.body
    assert_response 501
  end

  test 'bad gateway' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'bad_gateway' }
    assert_match /"status":502/, response.body
    assert_match /"message":"Bad gateway"/, response.body
    assert_response 502
  end

  test 'service unavailable' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'service_unavailable' }
    assert_match /"status":503/, response.body
    assert_match /"message":"Service unavailable"/, response.body
    assert_response 503
  end

  test 'gateway timeout' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'gateway_timeout' }
    assert_match /"status":504/, response.body
    assert_match /"message":"Gateway timeout"/, response.body
    assert_response 504
  end

  test 'http version not supported' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'http_version_not_supported' }
    assert_match /"status":505/, response.body
    assert_match /"message":"Ops"/, response.body
    assert_response 505
  end

  test 'insufficient storage' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'insufficient_storage' }
    assert_match /"status":507/, response.body
    assert_match /"message":"Insufficient storage"/, response.body
    assert_response 507
  end

  test 'not extended' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'not_extended' }
    assert_match /"status":510/, response.body
    assert_match /"message":"Not extended"/, response.body
    assert_response 510
  end

  test 'my custom error' do
    get '/errors/raise_error', headers: { 'Accept': 'application/json' },
                               params: { error: 'my_custom_error' }
    assert_match /"status":500/, response.body
    assert_match /"message":"This is a custom message."/, response.body
    assert_response 500
  end
end
