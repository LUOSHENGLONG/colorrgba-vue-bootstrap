const axios = require('axios')
axios.defaults.baseURL = 'http://127.0.0.1:3000'

// 请求拦截
// axios.interceptors.request.use( config => {
//     return config
// })

// axios.interceptors.response.use(config => {

// })

export default axios