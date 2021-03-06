import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
Vue.use(BootstrapVue)

import VueSession from 'vue-session'
Vue.use(VueSession)

import Home        from '../components/Home'
import Navigation  from '../components/Navigation'
import NewReview   from '../components/NewReview'
import Review      from '../components/Review'
import Question    from '../components/Question'
import NewQuestion from '../components/NewQuestion'
import NewReply    from '../components/NewReply'
import Reply       from '../components/Reply'
import Errors       from '../components/Errors'

import NewQuestionMail from '../components/NewQuestionMail'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    data: function(){return{}},
    components: { 
    	          'home':         Home,
    	          'navigation':   Navigation,
    	          'new-review':   NewReview,
    	          'review':       Review,
    	          'question':     Question,
    	          'new-question': NewQuestion,
                  'new-reply':    NewReply,
                  'reply':        Reply,
                  'new-question-mail': NewQuestionMail,
                  'errors': Errors,
                },
  }).$mount('#app')
})