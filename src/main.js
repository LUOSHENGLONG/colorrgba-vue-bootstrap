
// import Vue from 'vue'
import App from './App'
import router from './router'
// import $ from 'jquery'
// import ElementUI from 'element-ui'
import axios from './http'
// Vue.use(ElementUI)
Vue.prototype.$axios = axios
// import "bootstrap/dist/js/bootstrap";
//也可以在这里引入 bootstrap.css ;
//  import "element-ui/lib/theme-chalk/index.css"
Vue.config.productionTip = false

// 初始化css
import '@/assets/css/normalize.css'

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
