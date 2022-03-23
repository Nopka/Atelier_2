import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { Outils } from "./mixins/Outils.js";
Vue.mixin(Outils);
import axios from "axios";

// Vue.prototype.$api = new axios.create({
//     baseURL: "https://allweb.fun/coop/api/",
//     params: {},
//     headers: { Authorization: "bdfbc0e776274ecb4bcda97bf6f8535cae1c6f6b" },
// });

// Vue.prototype.$api.interceptors.request.use(function(config) {
//     if (store.state.token) {
//         config.params.token = store.state.token; //le token de connexion vers le compte utilisateur
//     }
//     return config;
// });


Vue.config.productionTip = false

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')

Vue.component("Header", () =>
    import ("@/components/Header.vue"));


Vue.component("Footer", () =>
    import ("@/components/Footer.vue"));

Vue.component("Eventform", () =>
    import ("@/components/Eventform.vue"));