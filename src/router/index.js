import Vue from 'vue'
import Router from 'vue-router'
// import Index from '@/view/Index'
// import Palette from '@/view/Palette'
// import Gradient from '@/view/Gradient'
// import Color from '@/view/Color'


// const Index = () => import('@/view/Index')
// const Palette = () => import('@/view/Palette')
// const Gradient = () => import('@/view/Gradient')
// const Color = () => import('@/view/Color')

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Index',
      component: resolve => require(['../view/Index.vue'], resolve)
    },
    {
      path: '/palette',
      name: 'Palette',
      component: resolve => require(['../view/Palette.vue'], resolve)
    }
    ,
    {
      path: '/gradient',
      name: 'Gradient',
      component: resolve => require(['../view/Gradient.vue'], resolve)
    },
    {
      path: '/color',
      name: 'Color',
      component: resolve => require(['../view/Color.vue'], resolve)
    }
  ]
})
