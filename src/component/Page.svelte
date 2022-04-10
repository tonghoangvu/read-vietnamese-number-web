<script lang="ts">
	import AboutPage from '../page/AboutPage.svelte'
	import DemoPage from '../page/DemoPage.svelte'
	import OptionPage from '../page/OptionPage.svelte'
	import Tab from './Tab.svelte'
</script>

<div class="row flex-center tabs">
	<Tab id="tab1" name="tabs" text="Demo" tab="demo" />
	<Tab id="tab2" name="tabs" text="Options" tab="option" />
	<Tab id="tab3" name="tabs" text="About" tab="about" />

	<!-- Render all pages, but let Paper.css active one -->
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
