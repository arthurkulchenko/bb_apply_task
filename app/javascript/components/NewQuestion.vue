<template>
  <div class="new-question-form">
   <b-form @submit="onSubmit" 
           @reset="onReset" 
           ref="form" 
           action="/questions" 
           method="post"
           accept-charset="UTF-8">
      <b-form-group
        id="exampleInputGroup1"
        label="Title:"
        label-for="Input"
      >

      <b-form-input
          id="Input"
          v-model="form.title"
          name="question[title]"
          required
          placeholder="Enter title" />
      </b-form-group>
      
      <b-form-group>
      <b-form-input
        v-model="form.csrf"
        name="authenticity_token"
        v-show="false"
      />
      </b-form-group>

      <b-form-group
        id="Text"
        label="Content:"
        label-for="Text"
      >
      <b-form-textarea
          id="Text"
          name="question[content]"
          v-model="form.content"
          required
          placeholder="Enter content" />
      </b-form-group>
      <div class="buttons">
      	<b-button type="submit" variant="primary">Submit</b-button>
        <b-button type="reset" variant="danger">Reset</b-button>
      </div>
    </b-form>
  </div>
</template>
<script type="text/javascript">
	export default {
    data() {
      return {
        form: {
          title: '',
          content: '',
          csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        },
        // show: true,
        // authenticity_token
      }
    },
    methods: {
      onSubmit(evt) {
      	evt.preventDefault()
        this.$refs.form.submit()
        // alert(
        // 	   JSON.stringify({
        // 	   	                question: this.form,
        // 	   	                csrf: this.csrf
        // 	   	              })
        // 	 )
      },
      onReset(evt) {
        evt.preventDefault()
        this.form.title = ''
        this.form.content = ''
        // this.$nextTick(() => {
        //   this.show = true
        // })
      }
    }
  }
</script>
<style type="text/css">
	.form-inline{
		height: 250px;
		width: auto;
	}
	.new-question-form{
		width: 900px;
		height: auto;
		margin: auto;
	}
	.buttons{
		text-align: center;
	}
</style>