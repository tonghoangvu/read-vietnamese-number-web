<script lang="ts">
	import * as store from '../store/index'

	export let id: string
	export let name: string
	export let text: string
	export let tab: string

	let activeTab: string
	$: isActive = tab === activeTab
	store.activeTab.subscribe((value) => (activeTab = value))

	function changeTab() {
		store.activeTab.set(tab)
		localStorage.setItem('active-tab', tab)
	}
</script>

<!-- Don't wrap these into a div, tabs will not work -->
<!-- Prevent default to avoid changing tab on click -->
<input type="radio" id="{id}" name="{name}" checked="{isActive}" />
<label for="{id}" on:click|preventDefault="{changeTab}">{text}</label>
