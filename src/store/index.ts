import { writable } from 'svelte/store'

const initialTab = localStorage.getItem('active-tab') ?? 'demo'

export const activeTab = writable(initialTab)
