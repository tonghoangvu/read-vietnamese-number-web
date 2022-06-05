<script lang="ts">
	function toggleDarkMode() {
		document.querySelector('html')?.classList.toggle('dark')
	}
</script>

<main>
	<p class="text-center">About page</p>
	<div class="row flex-center">
		<button on:click="{toggleDarkMode}">Toggle dark mode</button>
	</div>
</main>
