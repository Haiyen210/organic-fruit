import { createRouter, createWebHistory } from "vue-router";
import IndexBanner from "./view/Banner/index";
import IndexCategory from "./view/Category/index";
import IndexProduct from "./view/Product/index";
import IndexBlog from "./view/Blog/index";
import IndexAccount from "./view/Account/index";
import Home from "./view/home";
const routes = [{
        path: "/",
        name: "Home",
        component: Home,
    },
    {
        path: "/banner",
        name: "Index",
        component: IndexBanner,
    },
    {
        path: "/category",
        name: "IndexCate",
        component: IndexCategory,
    },
    {
        path: "/product",
        name: "IndexPro",
        component: IndexProduct,
    },
    {
        path: "/blog",
        name: "IndexBlog",
        component: IndexBlog,
    },
    
    {
        path: "/category",
        name: "IndexCat",
        component: IndexCategory,
    },
    
    {
        path: "/blog",
        name: "IndexBlog",
        component: IndexBlog,
    },
    {
        path: "/account",
        name: "IndexAccount",
        component: IndexAccount,
    },
];
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});

export default router;