// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  typescript: {
    strict: true,
    shim: false
  },
  css: [
    "bootstrap/dist/css/bootstrap.min.css",
    "@/assets/styles/common.scss"
  ],
  app: {
    head: {
      titleTemplate: '%s - Todo',
      title: 'Todo',
      htmlAttrs: {
        lang: 'ja'
      },
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { hid: 'description', name: 'description', content: '研修で作成した純正RailsアプリをNuxt.jsに移行' },
        { name: 'format-detection', content: 'telephone=no' }
      ],
      script: [],
      link: [],
      // please note that this is an area that is likely to change
      style: [],
      noscript: []
    }
  }
})
