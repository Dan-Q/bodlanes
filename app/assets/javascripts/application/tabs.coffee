# Implements smart jQuery UI tabs
$ ->
  setTimeout ->
    $('.tabs').tabs()
  , 100 # sufficient time for code editors to finish loading; HACK