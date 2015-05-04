require './app'
require './middlewares/realtime_backend'

use RealtimeApi::RealtimeBackend

run RealtimeApi::App
