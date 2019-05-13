import actions from './actions'
import getDefaultState from './state'

export default () => ({
  namespaced: true,

  state: getDefaultState(),

  actions,

  getters: {
    detailsVisible(state) {
      return state.detailsVisible
    },
    filterVisible(state) {
      return state.filterVisible
    },
    fleetchartVisible(state) {
      return state.fleetchartVisible
    },
    fleetchartScale(state) {
      return state.fleetchartScale
    },
    backRoute(state) {
      return state.backRoute
    },
  },

  /* eslint-disable no-param-reassign */
  mutations: {
    setFilterVisible(state, payload) {
      state.filterVisible = payload
    },
    setDetailsVisible(state, payload) {
      state.detailsVisible = payload
    },
    setFleetchartVisible(state, payload) {
      state.fleetchartVisible = payload
    },
    setFleetchartScale(state, payload) {
      state.fleetchartScale = payload
    },
    setBackRoute(state, payload) {
      state.backRoute = payload
    },
  },
  /* eslint-enable no-param-reassign */
})