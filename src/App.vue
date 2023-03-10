<template>
 <Login v-if="!user" @show="getHome($event)" />
  <div v-if="user">
    <Header />
    <SileBar />
    <router-view></router-view>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import SileBar from "./components/SileBar.vue";
import Login from "./view/Login";
import router from "./router";
export default {
  name: 'App',
  components: {
    Header,
    SileBar,
    Login,
  },
  data() {
    return {
      user: JSON.parse(localStorage.getItem("user")),
      isShowHome: false,
      check_user: null,
    };
  },
  mounted() {
    if (this.user) {
      router.push("/");
    } else {
      router.push("/login");
    }
  },
  methods: {
    getHome(data) {
      if (data) {
        this.check_user = data;
        this.isShowHome = true;
        router.push("/");
      } else {
        this.isShowHome = false;
      }
    },
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
