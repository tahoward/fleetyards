<template>
  <section class="container request-password">
    <div class="row">
      <div class="col-xs-12">
        <ValidationObserver
          v-slot="{ handleSubmit }"
          slim
        >
          <form @submit.prevent="handleSubmit(requestPassword)">
            <h1>
              <router-link
                to="/"
                exact
              >
                {{ $t('app') }}
              </router-link>
            </h1>

            <ValidationProvider
              v-slot="{ errors }"
              vid="email"
              rules="required|email"
              :name="$t('labels.email')"
              slim
            >
              <FormInput
                id="email"
                v-model="form.email"
                :error="errors[0]"
                type="email"
                hide-label-on-empty
                autofocus
              />
            </ValidationProvider>

            <Btn
              :loading="submitting"
              type="submit"
              size="large"
              block
            >
              {{ $t('actions.requestPassword') }}
            </Btn>

            <footer>
              <p class="text-center">
                {{ $t('labels.alreadyRegistered') }}
              </p>

              <Btn
                :to="{name: 'login'}"
                size="small"
                block
              >
                {{ $t('actions.login') }}
              </Btn>
            </footer>
          </form>
        </ValidationObserver>
      </div>
    </div>
  </section>
</template>

<script>
import MetaInfo from 'frontend/mixins/MetaInfo'
import FormInput from 'frontend/components/Form/FormInput'
import Btn from 'frontend/components/Btn'

export default {
  components: {
    FormInput,
    Btn,
  },

  mixins: [
    MetaInfo,
  ],

  data() {
    return {
      submitting: false,
      form: {
        email: null,
      },
    }
  },

  methods: {
    async requestPassword() {
      this.submitting = true

      await this.$api.post('password/request', this.form)

      this.submitting = false

      this.$success({
        text: this.$t('messages.requestPasswordChange.success'),
      })

      this.$router.push('/')
    },
  },
}
</script>

<style lang="scss">
  @import 'index';
</style>
