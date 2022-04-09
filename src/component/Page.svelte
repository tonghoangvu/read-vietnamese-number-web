<script lang="ts">
	import AboutPage from '../page/AboutPage.svelte'
	import DemoPage from '../page/DemoPage.svelte'
	import OptionPage from '../page/OptionPage.svelte'
	import Tab from './Tab.svelte'
</script>

<div class="row flex-center tabs">
	<Tab id="tab1" name="tabs" text="Demo" checked />
	<Tab id="tab2" name="tabs" text="Options" />
	<Tab id="tab3" name="tabs" text="About" />

	<div class="content" id="content1">
		<DemoPage />
	</div>
	<div class="content" id="content2">
		<OptionPage />
	</div>
	<div class="content" id="content3">
		<AboutPage />
	</div>
</div>

<style></style>
