<template>
	<div class="review">
      <b-card
        :title="title"
        tag="article"
        class="mb-2"
      >
        <b-card-text>
          {{ content }}
        </b-card-text>
        <p id="date">{{date}}</p>
      </b-card>
    </div>
</template>
<script type="text/javascript">
	export default{
		props:[
		  'title',
		  'content',
          'date',
		],
		data(){
			return{
			}
		}
	}
</script>
<style type="text/css">
  #date{
    text-align: right;
  }
</style>