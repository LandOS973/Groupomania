<template>
  <div id="nav">
    <router-link to="/"><img id="nav_groupomania" src="../image/icon-left-font-monochrome-white.svg" alt="lien acceuil"></router-link>
  </div>
  <router-view />
</template>

<style lang="scss">
body{
  margin : 0;
  background-color: #F0F2F5;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

#nav {
  padding: 30px;
  background-color: #091F43;
  &_groupomania{
    width: 200px;
  }
  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #D1515A;
    }
  } 
}
</style>
