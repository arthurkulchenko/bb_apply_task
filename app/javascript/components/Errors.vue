<template>
  <div class="errors">
  	<b-alert show variant="danger" dismissible v-if="this.errors != ''" class="errors">
      {{errors}}
   </b-alert>
  </div>
</template>
<script type="text/javascript">
  export default{
  	props:{
  		errors: String,
  	}
  }
</script>
<style type="text/css"></style>