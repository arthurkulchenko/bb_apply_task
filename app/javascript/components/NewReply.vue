<template>
  <div class="whole-reply">
  	<b-alert show variant="danger" dismissible v-if="this.errors != ''" class="errors">
  			 {{errors}}
   </b-alert>
	<div class="reply">
	  <b-card class="PlainUser">
     
        <b-form @submit="submitAndUserFronendValidation"
            ref="form" 
            v-bind:action="`/questions/${questionid}/replies`"
            method="post"
            accept-charset="UTF-8">
          
          <b-form-group>
            <b-form-input
              v-model="form.csrf"
              name="authenticity_token"
              v-show="false"
            />
          </b-form-group>

          <b-form-group>
            <b-form-input
              v-model="form.user_type"
              name="reply[user_type]"
              v-show="false"
            />
          </b-form-group>

          <b-form-group>
            <b-form-input
              v-model="form.email"
              name="reply[email]"
              v-show="false"
            />
          </b-form-group>
    
          <b-form-group
            id="Text"
            label="Reply:"
            label-for="Text"
          >
            <b-form-textarea id="Text"
                             name="reply[content]"
                             v-model="form.content"
                             required
                             placeholder="Enter your reply" />
          </b-form-group>
          <div class="buttons">
      	    <b-button type="submit" variant="primary">Submit</b-button>
          </div>
        </b-form>
          
      </b-card>	
	</div>
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
  export default{
  	mounted(){
  	  // console.warn("Email is: " + this.$session.get("email"))
     //  console.warn("this Email is: " + this.form.email)
  	},
    props:{
  		questionid:    String,
  		questionowner: String,
  	},
  	data(){ 
  	  return { 
  	  	       errors: '',
  	  	       showErrors: true,
  	  	       modalEmail: '',
  	  	       form: { 
  	  	       	       user_type: 'PlainUser',
  	  	       	       csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
  	  	       	       email: '',
  	  	       	       content: '',
  	  	       	     },
  	  }	
    },
    methods:{
      submitAndUserFronendValidation(e){
      	e.preventDefault()
        if (this.$session.get('email') != undefined){
          if (this.$session.get('email') == this.questionowner){
            this.form.email = this.$session.get('email')
            return this.$refs.form.submit()
          }else{
          	this.errors = "You are not the owner of the question, this action allowed only for owners."
          }
        }else{
          this.errors = "You didn't provide an email."
          // call email modal
          this.$refs.modalEmail.show()
        }
        this.showErrors = true
      },
      emailModalOkay(){
      	this.$session.set('email', this.modalEmail)
      	this.submitAndUserFronendValidation()
      },
      clearName(){
      	console.warn("clearName Not implemented")
      },
      handleSubmit(){
      	console.warn("handleSubmit Not implemented")
      },

    },
  }
</script>
<style type="text/css">
	.reply{
		width: 650px;
		margin: auto;
	}
	.AdminUser{
		width: 650px;
		margin-left: -100px;
		background: rgba(186,147,234,.3);
	}
	.PlainUser{
		width: 650px;
		background: rgba(234,232,92,.3);
		margin-left: 100px;
	}
	.errors{
      width: 900px;
      margin: auto;
    }
</style>