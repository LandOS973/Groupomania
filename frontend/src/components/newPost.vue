<template>
  <div class="home">
    <div class="newPost">
      <form method="post">
        <input
          type="text"
          name="newPost"
          id="newPost"
          placeholder="Quoi de neuf ?"
        />
      </form>
    </div>
  </div>
</template>


<script>
    export default {
        
    }
</script>

<style lang="scss" scoped>
.newPost {
  background-color: white;
  width: 680px;
  border: 1px solid;
  margin: 50px auto 50px auto;
  padding: 20px;
}
</style>