<template>
	<div class="new-question-mail">
	  <h1>New Question appears, please take it before others did!</h1>
	  <h2>{{questiontitle}}</h2>
	  <p>
		  {{questioncontent}}
	  </p>
	  <a href="localhost:3000/admin">Hurry up!</a>
	</div>
</template>
<script type="text/javascript">
	export default{
		props: {
			questiontitle: String,
			questioncontent: String,
		}
	}
</script>
<style type="text/css">
	.new-question-mail{
		width: 900px;
		margin: auto;
	}
</style>