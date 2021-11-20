import { createStore } from "vuex";

export default createStore({
  state: {
    routeUserId: null,
  },
  mutations: {
    changeUserId(state,newId){
      state.userId = newId;
    }
  },
  actions: {},
  modules: {},
});
