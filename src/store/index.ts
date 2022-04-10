import { writable } from 'svelte/store'

const initialTab = 'demo'

export const activeTab = writable(initialTab)
