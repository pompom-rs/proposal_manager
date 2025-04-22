import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

// Komponenta pro testování
const HelloWorld = {
  name: 'HelloWorld',
  template: '<div>Hello, {{ name }}!</div>',
  props: {
    name: {
      type: String,
      default: 'World'
    }
  }
}

// Nastavení Vuetify pro testy
const vuetify = createVuetify({
  components,
  directives
})

describe('HelloWorld', () => {
  it('renders properly', () => {
    const wrapper = mount(HelloWorld, {
      props: { name: 'Vitest' },
      global: {
        plugins: [vuetify]
      }
    })
    expect(wrapper.text()).toContain('Hello, Vitest!')
  })

  it('uses default prop value', () => {
    const wrapper = mount(HelloWorld, {
      global: {
        plugins: [vuetify]
      }
    })
    expect(wrapper.text()).toContain('Hello, World!')
  })
})
