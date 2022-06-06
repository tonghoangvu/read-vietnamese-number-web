<script lang="ts">
	function toggleDarkMode() {
		document.querySelector('html')?.classList.toggle('dark')
	}
</script>

<main>
	<div class="row flex-center">
		<div class="col text-center">
			<figure class="margin-none">
				<img src="/favicon.png" alt="Read Vietnamese Number logo" />
				<figcaption class="margin-top-small">Version 0.0</figcaption>
			</figure>
			<h4 class="margin-top margin-bottom">Read Vietnamese Number</h4>
			<p>
				A library converts number to text in Vietnamese<br />
				Support JavaScript and TypeScript
			</p>
			<div class="margin-top">
				<a
					href="https://www.npmjs.com/package/read-vietnamese-number"
					target="_blank">
					Published on NPM
				</a>
			</div>
			<div class="margin-top">
				<a
					href="https://github.com/tonghoangvu/read-vietnamese-number"
					target="_blank">
					Checkout GitHub repository
				</a>
			</div>
		</div>
	</div>
	<div class="row flex-center">
		<div class="col">
			<button on:click="{toggleDarkMode}">Toggle dark mode</button>
		</div>
	</div>
</main>

<style>
	.row {
		margin-bottom: unset;
	}

	img {
		margin-left: auto;
		margin-right: auto;
	}
</style>
