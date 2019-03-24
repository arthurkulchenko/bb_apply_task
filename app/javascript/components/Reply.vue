<template>
  <div>
	<div class="reply">
	  <b-card v-bind:class="user_type">
        <b-card-text>
          {{ content }}
        </b-card-text>
      </b-card>	
	</div>
  </div>
</template>
<script type="text/javascript">
  export default{
  	props:{
  	  content: String,
  	  user_type: String,
  	},
  	data(){return{
  		form:{
  			content: '',
  		}
  	}},
  }
</script>
<style type="text/css">
	.reply{
		width: 650px;
		margin: auto;
	}
	.AdminUser{
		width: 650px;
		/*margin-right: 350px;*/
		margin-left: -100px;
		background: rgba(186,147,234,.3);
	}
	.PlainUser{
		width: 650px;
		background: rgba(234,232,92,.3);
		margin-left: 100px;
	}
</style>