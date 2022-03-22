import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [{
        path: '/',
        name: 'Login',
        component: () =>
            import ('../views/Login.vue')
    },
    {
        path: '/SingnIn',
        name: 'SingnIn',
        component: () =>
            import ('../views/SingnIn.vue')
    },
    {
        path: '/Accueil',
        name: 'Accueil',
        component: () =>
            import ('../views/Accueil.vue')
    },
    {
        path: '/FormEvent',
        name: 'FormEvent',
        component: () =>
            import ('../views/FormEvent.vue')
    },
    {
        path: '/ProfilUser',
        name: 'ProfilUser',
        component: () =>
            import ('../views/ProfilUser.vue')
    },
    {
        path: '/NotificationsUser',
        name: 'NotificationsUser',
        component: () =>
            import ('../views/NotificationsUser.vue')
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router