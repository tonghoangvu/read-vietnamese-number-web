<script lang="ts">
	import Page from './component/Page.svelte'
	import Footer from './component/Footer.svelte'
</script>

<div class="container paper">
	<h3 class="text-secondary margin">Page title</h3>
	<Page />
	<hr class="margin-bottom-large" />
	<Footer />
</div>

<style>
	h3 {
		text-align: center;
	}
</style>
