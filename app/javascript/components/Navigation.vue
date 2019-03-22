<template>
    <div>
      <b-nav justified tabs>
        <b-nav-item href="/">Home</b-nav-item>
        <b-nav-item href="/reviews">Reviews</b-nav-item>
        <b-nav-item href="/questions">Questions</b-nav-item>
        <b-nav-item v-show="menuItemShow" href="#" v-on:click="checkEmail()">
            {{defaultText}}
        </b-nav-item>
        <b-nav-item-dropdown href="#" v-on:click="checkEmail()" :text="email" right
                             v-show="!menuItemShow">
        <b-dropdown-item href="#" 
                         @click="deleteSession"
                         v-show="!menuItemShow">
           sign out
        </b-dropdown-item>
        </b-nav-item-dropdown>
      </b-nav>
      <b-modal v-model="modalShow"
               @ok="firstModalOkay">
      	Oooor, just leave your email, haa?
      </b-modal>
      <b-modal
        id="modalPrevent"
        ref="modalEmail"
        title="Submit your name"
        @ok="emailModalOkay"
        @shown="clearName"
      >
        <form @submit.stop.prevent="handleSubmit">
          <b-form-input type="text" placeholder="Enter your email" v-model="email" />
        </form>
      </b-modal>
    </div>
</template>
<script type="text/javascript">
	export default{
		mounted(){
		  if (this.$session.get('email') != undefined){
		    this.menuItem = this.$session.get('email')
		    this.email = this.$session.get('email')
		    this.menuItemShow = false
		  }
		},
		data(){
			return{
				defaultText: "please ✍️ email to us",
				email: "",
				modalShow: false,
				menuItemShow: true,
			}
		},
		methods:{
		  checkEmail(){
		  	if (this.$session.get('email') == undefined){
		  	  this.modalShow = true
		  	}
		  },
		  firstModalOkay(){
		  	this.$refs.modalEmail.show()
		  },
		  emailModalOkay(){
            this.$session.set('email', this.email)
            this.$session.set('menuItemShow', false)
            this.menuItemShow = false

		  },
		  clearName(){},
		  handleSubmit(){},
		  deleteSession(){
		  	this.$session.destroy()
		  	this.menuItemShow = true
		  },
		},
	}
</script>
<style type="text/css"></style>