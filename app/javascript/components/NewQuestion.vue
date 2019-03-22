<template>
  <div class="new-question-form">
    <!-- <b-alert variant="danger" dismissible v-model="showDismissibleAlert"> -->
   <b-alert variant="danger" dismissible v-if="this.errors != ''">
      {{errors}}
   </b-alert>
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

      <b-form-input
          id="Input"
          v-model="form.email"
          name="question[email]"
          v-show="false" />

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
      <b-modal
        id="modalPrevent"
        ref="modalEmail"
        title="Submit your email"
        @ok="emailModalOkay"
        @shown="clearName">
        <form @submit.stop.prevent="handleSubmit">
          <b-form-input type="text" placeholder="Enter your email" v-model="modalEmail" />
        </form>
      </b-modal>
  </div>
</template>
<script type="text/javascript">
	export default {
    mounted(){},
    props:{
      errors: String,
    },
    data() {
      return {
        modalEmail: '',
        form: {
          title: '',
          content: '',
          csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          email: this.$session.get('email'),
        },
        showDismissibleAlert: true,
      }
    },
    methods: {
      onSubmit(evt) {
      	evt.preventDefault()
        if ( this.$session.get('email') != undefined){
          this.form.email = this.$session.get('email')
          this.$refs.form.submit()
        }else{
          this.form.email = ''
          this.$refs.modalEmail.show()
        }
      },
      onReset(evt) {
        evt.preventDefault()
        this.form.title = ''
        this.form.content = ''
      },
      emailModalOkay(){
        this.form.email = this.modalEmail
        this.$session.set("email", this.modalEmail)
        if (this.form.title != '' && this.form.content != '' && this.form.email != ''){
          this.$refs.form.submit()
        }
      },
      clearName(){},
      handleSubmit(){},
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