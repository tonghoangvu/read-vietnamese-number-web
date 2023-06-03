import { writable } from 'svelte/store'
import { ReadingConfig } from 'read-vietnamese-number'

const initialTab = localStorage.getItem('active-tab') ?? 'demo'
const initialConfig = new ReadingConfig()

export const activeTab = writable(initialTab)
export const readingConfig = writable(initialConfig)
