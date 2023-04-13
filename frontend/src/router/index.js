import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
      meta: {
        requiresAuth: false,
        title: "Home / Student Work",
      },
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue"),
      meta: {
        requiresAuth: false,
        title: "About / Students",
      },
    },

    {
      path: "/students",
      name: "students",
      component: () => import("../views/Students.vue"),
      meta: {
        requiresAuth: true,
        title: "Students / Student",
      },
    },
    {
      path: "/employers",
      name: "employers",
      component: () => import("../views/Employers.vue"),
      meta: {
        requiresAuth: true,
        title: "Employers / Employer",
      },
    },
    {
      path: "/projects",
      name: "projects",
      component: () => import("../views/Projects.vue"),
      meta: {
        requiresAuth: false,
        title: "Projects / Project",
      },
    },

    
    {
      path: "/login",
      name: "login",
      component: () => import("../views/LoginView.vue"),
      meta: {
        requiresAuth: false,
        title: "Login / Taxi",
      },
    },
    {
      path: "/:pathMatch(.*)*",
      name: "PageNotFound",
      component: () => import("../views/404View.vue"),
      meta: {
        requiresAuth: false,
        title: "404 / Taxi",
      },
    },
  ],
});

export default router;
