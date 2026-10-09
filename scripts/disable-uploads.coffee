# Description:
#   Security hardening: stop Hubot's built-in HTTP server from accepting file uploads.
#
# Notes:
#   Hubot 3 installs the connect-multiparty middleware in front of every route.
#   Any client that can reach the HTTP port can POST multipart files (up to
#   100 MB per request, no authentication, even to a path that returns 404);
#   they are written to the temp directory and never removed. Nothing in this
#   bot handles uploads, so remove that middleware. connect-multiparty has no
#   patched release and cannot be dropped without replacing Hubot 3.

module.exports = (robot) ->
  router = robot.router?._router
  return unless router?.stack?
  router.stack = router.stack.filter (layer) -> layer.name isnt 'multipart'
