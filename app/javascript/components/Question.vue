<template>
	<div class="question">
      <b-card
        :title="title"
        tag="article"
        class="mb-2"
      >
        <b-card-text>
          {{ content }}
        </b-card-text>
        <p id="replies-paragraph">replies: <span id="replies">{{replies}}</span></p>
        <p id="date">{{date}}</p>
        <b-button :href="`/questions/${id}`" variant="primary">Show more...</b-button>
      </b-card>
    </div>
</template>
<script type="text/javascript">
	export default{
		props:{
          id: String,
          question: String,
		  title: String,
		  content: String,
          date: String,
          replies: String,
		},
		data(){
			return{
			}
		}
	}
</script>
<style type="text/css">
  #replies{
    text-decoration: bold;
    color: orange;
  }
  #date{
    text-align: right;
  }
  #replies-paragraph{
     text-align: left;
  }
</style>