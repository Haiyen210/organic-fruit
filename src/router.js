import { createRouter, createWebHistory } from "vue-router";
import IndexBanner from "./view/Banner/index";
import AddBanner from "./view/Banner/add";
import IndexCategory from "./view/Category/index";
import AddCategory from "./view/Category/add";
import IndexBlog from "./view/Blog/index";
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
        path: "/add",
        name: "Add",
        component: AddBanner,
    },
    
    {
        path: "/category",
        name: "IndexCat",
        component: IndexCategory,
    },
    {
        path: "/addCat",
        name: "AddCat",
        component: AddCategory,
    },
    
    {
        path: "/blog",
        name: "IndexBlog",
        component: IndexBlog,
    },
];
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});

export default router;