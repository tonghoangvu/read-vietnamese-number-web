<script lang="ts">
	function toggleDarkMode() {
		document.querySelector('html')?.classList.toggle('dark')
	}
</script>

<main>
	<p>About page</p>
	<div class="row flex-center">
		<button on:click="{toggleDarkMode}">Toggle dark mode</button>
	</div>
</main>

<style>
	p {
		text-align: center;
	}
</style>
