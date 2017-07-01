#= require jquery
#= require jquery_ujs
#= require tether
#= require bootstrap-sprockets
#= require select2-4.0.3.full

Turbolinks = require "turbolinks"
Vue = require "vue/dist/vue"
VueLazyload = require "vue-lazyload"
moment = require "moment-timezone"
Cookies = require "js-cookie"

require "moment/locale/ja"

document.addEventListener "turbolinks:load", (event) ->
  vueLazyLoad = require "./common/vueLazyLoad"

  activities = require "./common/components/activities"
  amazonItemAttacher = require "./common/components/amazonItemAttacher"
  analytics = require "./common/components/analytics"
  body = require "./common/components/body"
  channelReceiveButton = require "./common/components/channelReceiveButton"
  channelSelector = require "./common/components/channelSelector"
  commentGuard = require "./common/components/commentGuard"
  episodeList = require "./common/components/episodeList"
  episodeProgress = require "./common/components/episodeProgress"
  favoriteButton = require "./common/components/favoriteButton"
  flash = require "./common/components/flash"
  followButton = require "./common/components/followButton"
  inputWordsCount = require "./common/components/inputWordsCount"
  likeButton = require "./common/components/likeButton"
  omittedSynopsis = require "./common/components/omittedSynopsis"
  muteUserButton = require "./common/components/muteUserButton"
  programList = require "./common/components/programList"
  ratingLabel = require "./common/components/ratingLabel"
  ratingStateLabel = require "./common/components/ratingStateLabel"
  record = require "./common/components/record"
  recordRating = require "./common/components/recordRating"
  recordSorter = require "./common/components/recordSorter"
  recordTextarea = require "./common/components/recordTextarea"
  recordWordCount = require "./common/components/recordWordCount"
  statusSelector = require "./common/components/statusSelector"
  timeAgo = require "./common/components/timeAgo"
  tips = require "./common/components/tips"
  untrackedEpisodeList = require "./common/components/untrackedEpisodeList"
  userHeatmap = require "./common/components/userHeatmap"
  usernamePreview = require "./common/components/usernamePreview"
  workFriends = require "./common/components/workFriends"
  youtubeModalPlayer = require "./common/components/youtubeModalPlayer"

  resourceSelect = require "./common/directives/resourceSelect"

  moment.locale(gon.user.locale)
  Cookies.set("ann_time_zone", moment.tz.guess(), domain: ".annict.com", secure: true)

  Vue.config.debug = true

  Vue.use(VueLazyload)

  Vue.component("c-activities", activities)
  Vue.component("c-amazon-item-attacher", amazonItemAttacher)
  Vue.component("c-analytics", analytics(event))
  Vue.component("c-body", body)
  Vue.component("c-channel-receive-button", channelReceiveButton)
  Vue.component("c-channel-selector", channelSelector)
  Vue.component("c-comment-guard", commentGuard)
  Vue.component("c-episode-list", episodeList)
  Vue.component("c-episode-progress", episodeProgress)
  Vue.component("c-favorite-button", favoriteButton)
  Vue.component("c-flash", flash)
  Vue.component("c-follow-button", followButton)
  Vue.component("c-input-words-count", inputWordsCount)
  Vue.component("c-like-button", likeButton)
  Vue.component("c-omitted-synopsis", omittedSynopsis)
  Vue.component("c-mute-user-button", muteUserButton)
  Vue.component("c-program-list", programList)
  Vue.component("c-rating-label", ratingLabel)
  Vue.component("c-rating-state-label", ratingStateLabel)
  Vue.component("c-record", record)
  Vue.component("c-record-rating", recordRating)
  Vue.component("c-record-sorter", recordSorter)
  Vue.component("c-record-textarea", recordTextarea)
  Vue.component("c-record-word-count", recordWordCount)
  Vue.component("c-status-selector", statusSelector)
  Vue.component("c-time-ago", timeAgo)
  Vue.component("c-tips", tips)
  Vue.component("c-untracked-episode-list", untrackedEpisodeList)
  Vue.component("c-user-heatmap", userHeatmap)
  Vue.component("c-username-preview", usernamePreview)
  Vue.component("c-work-friends", workFriends)
  Vue.component("c-youtube-modal-player", youtubeModalPlayer)

  Vue.directive("resource-select", resourceSelect)

  Vue.nextTick ->
    vueLazyLoad.refresh()

  new Vue
    el: ".p-application"

Turbolinks.start()
