<template>
  <header>
    <div class="navigation">
      <nav
        class="
          navbar navbar-expand-lg navbar-light
          white
          fixed-top
          nav
          justify-content-center
        "
      >
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/"
                ><img
                  id="nav_groupomania"
                  src="../image/icon-left-font-monochrome-white.svg"
                  alt="lien acceuil"
              /></router-link>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/connect"
                ><img
                  id="nav_groupomania"
                  src="../image/sign-out-alt-solid.svg"
                  alt="logout"
                  class="logout"
              /></router-link>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </header>
  <router-view />
</template>

<style lang="scss">
.logout{
  height: 30px;
}
.navbar {
  border-bottom: 1px solid #dbdbdb;
}

.navigation {
  padding-bottom: 30px;
}

.white {
  background-color: #fff;
}

body {
  margin: 0;
  background-color: #fafafa;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

* {
  box-sizing: border-box;
}

#nav {
  padding: 30px;
  background-color: #091f43;
  &_groupomania {
    width: 200px;
  }
  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #d1515a;
    }
  }
}
</style>
