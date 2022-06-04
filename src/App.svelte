<script lang="ts">
	import Page from './component/Page.svelte'
	import Footer from './component/Footer.svelte'

	import * as store from './store/index'

	let activeTab: string
	store.activeTab.subscribe((value) => (activeTab = value))

	const TITLE_MAP = new Map([
		['demo', 'Live demo'],
		['option', 'Options'],
		['about', 'About app'],
	])
	$: title = TITLE_MAP.get(activeTab) ?? 'Not found'
</script>

<div class="container paper">
	<h3 class="text-secondary margin">{title}</h3>
	<Page />
	<hr class="margin-bottom-large" />
	<Footer />
</div>

<style>
	h3 {
		text-align: center;
	}
</style>
